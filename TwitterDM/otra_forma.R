# load twitter library - the rtweet library is recommended now over twitteR
library(rtweet)
# plotting and pipes - tidyverse!
library(ggplot2)
library(dplyr)
# text mining library
library(tidytext)

#USANDO rtweet Y tidytext : SACADO DE https://www.earthdatascience.org/courses/earth-analytics/get-data-using-apis/use-twitter-api-r/
install.packages(c("rtweet", "tidytext"))


## Despues de crear la app en tweeter dev
## Authentication via web browser requires the httpuv package to be installed.
## install httpuv if not already
if (!requireNamespace("httpuv", quietly = TRUE)) {
  install.packages("httpuv")
}


# whatever name you assigned to your created app
appname <- "KoalaBotDM"

## api key (example below is not a real key)
key <- "YjSluY2KLmhUOL57Hpj6epzD7"

## api secret (example below is not a real key)
secret <- "uSPAPDbzKI9VTJOM5tJBdG2wl8bOvvlW8U1yjQ77mCVcstQGma"

access_token <-"1202577996776906758-PK0GOWRtLIslT3TO8F2zcjdt9SbRPS"
  
access_secret_token <-"GGrp8hpBGvngZkilaAvSI0UMLOv2Y9pbO7UBL5SxT3noR"


# create token named "twitter_token"
## autheticate via web browser
twitter_token <- create_token(
  app = appname,
  consumer_key = key,
  consumer_secret = secret,
  access_token = access_token,
  access_secret = access_secret_token)

## check to see if the token is loaded
identical(twitter_token, get_token())

#***********************************************
#To get the current development version from Github:
  
  ## install remotes package if it's not already
  if (!requireNamespace("remotes", quietly = TRUE)) {
    install.packages("remotes")
  }

## install dev version of rtweet from github
remotes::install_github("ropensci/rtweet")

## load rtweet package
library(rtweet)
#***********************************************

# post a tweet from R
post_tweet("Hello World from #R")
## your tweet has been posted!
#Me tiraba este error: Error: cannot exceed 280 characters. Busqué la solución en Internet:
#*****************************
#While this issue is not fixed in the package itself, one can programmatically fix it after loading {rtweet} with these lines:
  library(rtweet)

is_tweet_length <- function(.x, n = 280) {
  .x <- gsub("https?://[[:graph:]]+\\s?", "", .x)
  while (grepl("^@\\S+\\s+", .x)) {
    .x <- sub("^@\\S+\\s+", "", .x)
  }
  !(nchar(.x) <= n)   # here's the fix
}


assignInNamespace("is_tweet_length", is_tweet_length, ns = "rtweet")
#Now post_tweet() should work as expected.

#*****************************

#search_tweets() requires the following arguments:
#q: the query word that you want to look for
#n: the number of tweets that you want returned. You can request up to a maximum of 18,000 tweets.
#To see what other arguments you can use with this function, use the R help:
#?search_tweets

## search for 500 tweets using the #rstats hashtag
arte_hashtag <- search_tweets(q = "#arte", n = 18000)
arte_word <- search_tweets(q = "arte", n = 18000)

save_as_csv(arte_hashtag, file_name = "arte_hashtag", prepend_ids = TRUE, na = "",
            fileEncoding = "UTF-8")

save_as_csv(arte_word, file_name = "arte_word", prepend_ids = TRUE, na = "",
            fileEncoding = "UTF-8")

# view the first 3 rows of the dataframe
head(rstats_tweets, n = 3)

# find recent tweets with #rstats but ignore retweets
rstats_tweets <- search_tweets("#rstats", n = 500,
                               include_rts = FALSE)
# view top 2 rows of data
head(rstats_tweets, n = 2)

# view column with screen names - top 6
head(rstats_tweets$screen_name)

# get a list of unique usernames
unique(rstats_tweets$screen_name)

#You can similarly use the search_users() function to just see what users are tweeting using a particular hashtag. This function returns just a data.frame of the users and information about their accounts.

# what users are tweeting with #rstats
users <- search_users("#rstats",
                      n = 500)
# just view the first 2 users - the data frame is large!
head(users, n = 2)

#First, where are they from?
  
# how many locations are represented
  length(unique(users$location))

users %>%
  ggplot(aes(location)) +
  geom_bar() + coord_flip() +
  labs(x = "Count",
       y = "Location",
       title = "Twitter users - unique locations ")