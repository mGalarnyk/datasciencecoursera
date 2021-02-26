function submitWithConfiguration(conf)
  addpath('./lib/jsonlab');

  parts = Parts(conf); % Updated

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
    fprintf( ...
      '!! Submission failed: unexpected error: %s\n', ...
      e.message);
    fprintf('!! Please try again later.\n');
    return
  end

  if isfield(response, 'errorMessage')
    fprintf('!! Submission failed: %s\n', response.errorMessage);
  else
    showFeedback(parts, response);
    save(tokenFile, 'email', 'token');
  end
  rmpath('./lib/jsonlab', './lib'); % Updated
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
  submissionUrl = SubmissionUrl(); % Updated
  params = {'jsonBody', body};
  responseBody = urlread(submissionUrl, 'post', params);
  response = loadjson(responseBody);
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

function [parts] = Parts(conf) % Updated
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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%
% Service configuration
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function submissionUrl = SubmissionUrl() % Updated
  submissionUrl = 'https://www-origin.coursera.org/api/onDemandProgrammingImmediateFormSubmissions.v1';
end
