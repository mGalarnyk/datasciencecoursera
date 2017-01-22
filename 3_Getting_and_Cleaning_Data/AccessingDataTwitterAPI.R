#install.packages("twitteR")
library(twitteR)

consumer_key <- "OQMbUsBfWQ1mVUGASpSArbG33"
consumer_secret <- "GQ5kc0BlwJZE2FYyvv8cxn845z32ES6HsID87cawkQ075jwyIy"
access_token <- 	"4338966852-lBmLvEg9mADHIdjK2hT4W5mtHmI9jRKxcV4PTrB"
access_secret <- "AwKRZw9AvTMvMrb2jouX5JHTjDASI3zeceVsemgQa1SSq"

setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)
tw = twitteR::searchTwitter('#realDonaldTrump + #HillaryClinton', n = 1e4, since = '2016-11-08', retryOnRateLimit = 1e3)
d = twitteR::twListToDF(tw)
