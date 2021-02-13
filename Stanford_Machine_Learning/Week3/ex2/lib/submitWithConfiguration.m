function submitWithConfiguration(conf)
  addpath('./lib/jsonlab');

  parts = parts(conf);

  fprintf('== Submitting solutions | %s...\n', conf.itemName);

  tokenFile = 'token.mat';
  if exist(tokenFile, 'file')
    load(tokenFile);
    [email token] = promptToken(email, token, tokenFile);
  else
    [email token] = promptToken('', '', tokenFile);
  end

  if isempty(token)
    fprintf('!! Submission Cancelled\n');
    return
  end

  try
    response = submitParts(conf, email, token, parts);
  catch
    e = lasterror();
    fprintf('\n!! Submission failed: %s\n', e.message);
    fprintf('\n\nFunction: %s\nFileName: %s\nLineNumber: %d\n', ...
      e.stack(1,1).name, e.stack(1,1).file, e.stack(1,1).line);
    fprintf('\nPlease correct your code and resubmit.\n');
    return
  end

  if isfield(response, 'errorMessage')
    fprintf('!! Submission failed: %s\n', response.errorMessage);
  elseif isfield(response, 'errorCode')
    fprintf('!! Submission failed: %s\n', response.message);
  else
    showFeedback(parts, response);
    save(tokenFile, 'email', 'token');
  end
end

function [email token] = promptToken(email, existingToken, tokenFile)
  if (~isempty(email) && ~isempty(existingToken))
    prompt = sprintf( ...
      'Use token from last successful submission (%s)? (Y/n): ', ...
      email);
    reenter = input(prompt, 's');

    if (isempty(reenter) || reenter(1) == 'Y' || reenter(1) == 'y')
      token = existingToken;
      return;
    else
      delete(tokenFile);
    end
  end
  email = input('Login (email address): ', 's');
  token = input('Token: ', 's');
end

function isValid = isValidPartOptionIndex(partOptions, i)
  isValid = (~isempty(i)) && (1 <= i) && (i <= numel(partOptions));
end

function response = submitParts(conf, email, token, parts)
  body = makePostBody(conf, email, token, parts);
  submissionUrl = submissionUrl();

  responseBody = getResponse(submissionUrl, body);
  jsonResponse = validateResponse(responseBody);
  response = loadjson(jsonResponse);
end

function body = makePostBody(conf, email, token, parts)
  bodyStruct.assignmentSlug = conf.assignmentSlug;
  bodyStruct.submitterEmail = email;
  bodyStruct.secret = token;
  bodyStruct.parts = makePartsStruct(conf, parts);

  opt.Compact = 1;
  body = savejson('', bodyStruct, opt);
end

function partsStruct = makePartsStruct(conf, parts)
  for part = parts
    partId = part{:}.id;
    fieldName = makeValidFieldName(partId);
    outputStruct.output = conf.output(partId);
    partsStruct.(fieldName) = outputStruct;
  end
end

function [parts] = parts(conf)
  parts = {};
  for partArray = conf.partArrays
    part.id = partArray{:}{1};
    part.sourceFiles = partArray{:}{2};
    part.name = partArray{:}{3};
    parts{end + 1} = part;
  end
end

function showFeedback(parts, response)
  fprintf('== \n');
  fprintf('== %43s | %9s | %-s\n', 'Part Name', 'Score', 'Feedback');
  fprintf('== %43s | %9s | %-s\n', '---------', '-----', '--------');
  for part = parts
    score = '';
    partFeedback = '';
    partFeedback = response.partFeedbacks.(makeValidFieldName(part{:}.id));
    partEvaluation = response.partEvaluations.(makeValidFieldName(part{:}.id));
    score = sprintf('%d / %3d', partEvaluation.score, partEvaluation.maxScore);
    fprintf('== %43s | %9s | %-s\n', part{:}.name, score, partFeedback);
  end
  evaluation = response.evaluation;
  totalScore = sprintf('%d / %d', evaluation.score, evaluation.maxScore);
  fprintf('==                                   --------------------------------\n');
  fprintf('== %43s | %9s | %-s\n', '', totalScore, '');
  fprintf('== \n');
end

% use urlread or curl to send submit results to the grader and get a response
function response = getResponse(url, body)
% try using urlread() and a secure connection
  params = {'jsonBody', body};
  [response, success] = urlread(url, 'post', params);

  if (success == 0)
    % urlread didn't work, try curl & the peer certificate patch
    if ispc
      % testing note: use 'jsonBody =' for a test case
      json_command = sprintf('echo jsonBody=%s | curl -k -X POST -d @- %s', body, url);
    else
      % it's linux/OS X, so use the other form
      json_command = sprintf('echo ''jsonBody=%s'' | curl -k -X POST -d @- %s', body, url);
    end
    % get the response body for the peer certificate patch method
    [code, response] = system(json_command);
    % test the success code
    if (code ~= 0)
      fprintf('[error] submission with curl() was not successful\n');
    end
  end
end

% validate the grader's response
function response = validateResponse(resp)
  % test if the response is json or an HTML page
  isJson = length(resp) > 0 && resp(1) == '{';
  isHtml = findstr(lower(resp), '<html');

  if (isJson)
    response = resp;
  elseif (isHtml)
    % the response is html, so it's probably an error message
    printHTMLContents(resp);
    error('Grader response is an HTML message');
  else
    error('Grader sent no response');
  end
end

% parse a HTML response and print it's contents
function printHTMLContents(response)
  strippedResponse = regexprep(response, '<[^>]+>', ' ');
  strippedResponse = regexprep(strippedResponse, '[\t ]+', ' ');
  fprintf(strippedResponse);
end




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Service configuration
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function submissionUrl = submissionUrl()
  submissionUrl = 'https://www-origin.coursera.org/api/onDemandProgrammingImmediateFormSubmissions.v1';
end
