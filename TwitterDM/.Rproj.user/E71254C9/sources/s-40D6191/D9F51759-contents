##Obtenido de http://www.diegocalvo.es/obtener-datos-de-twitter-con-r-usando-su-api/
# installing/loading the latest installr package:
#install.packages("installr") 
#library(installr) # install+load installr
#updateR() # updating R.

# Instalar las librerías siguientes:
install.packages("ROAuth");
install.packages("base64enc");
install.packages("twitteR");
install.packages("streamR");

# Cargar las librerias:
library("ROAuth");
library("base64enc");
library("twitteR");
library("streamR");

# Cargar parámetros de configuración
reqURL <- "https://api.twitter.com/oauth/request_token"
accessURL <- "https://api.twitter.com/oauth/access_token"
authURL <- "https://api.twitter.com/oauth/authorize"
options(httr_oauth_cache=T)

# Cargar las credenciales obtenidas del paso anterior
consumer_key <- "YjSluY2KLmhUOL57Hpj6epzD7"
consumer_secret <-"uSPAPDbzKI9VTJOM5tJBdG2wl8bOvvlW8U1yjQ77mCVcstQGma"
access_token <-"1202577996776906758-PK0GOWRtLIslT3TO8F2zcjdt9SbRPS"
access_secret <-"GGrp8hpBGvngZkilaAvSI0UMLOv2Y9pbO7UBL5SxT3noR"

# Ejecutar la autenticación de TwitteR
setup_twitter_oauth(consumer_key, consumer_secret, access_token, access_secret)

# streamR authentication
credentials_file <- "my_oauth.Rdata"

if (file.exists(credentials_file)){
  load(credentials_file)
} else {
  cred <- OAuthFactory$new(consumerKey = consumer_key, consumerSecret =
                             consumer_secret, requestURL = reqURL, accessURL = accessURL, authURL = authURL)
  cred$handshake(cainfo = system.file("CurlSSL", "cacert.pem", package = "RCurl"))
  save(cred, file = credentials_file)
}