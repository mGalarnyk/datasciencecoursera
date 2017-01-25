#install.packages("twitteR")
library(twitteR)

consumer_key <- "ehGQ5wrl51A5eHVPa7P2eObBn"
consumer_secret <- "3gUna1oxe3jeorn5ai0cQh0vutSlIEl246KAH4tFVh29IopQbR"
access_token <- 	"4338966852-S1rKY6euReyxBcAkDN24XOvBpAPVJZWx6KkJPqn"
access_secret <- "uWFS7tQ9TIS4dipNNe6jSf3SAPve8BOobTghvJcBq5B5t"

setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)
tw = twitteR::searchTwitter('#realDonaldTrump + #HillaryClinton', n = 1e4, since = '2016-11-08', retryOnRateLimit = 1e3)
d = twitteR::twListToDF(tw)
