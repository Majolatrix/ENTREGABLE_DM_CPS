#Obtenido de http://www.diegocalvo.es/obtener-datos-de-twitter-con-r-usando-su-api/
# Cargar las librerías específicas
library(twitteR);
library(streamR);

# Leer el fichero de credenciales creado anteriormente
source('credenciales.R')

# Capturar tweets en el fichero "tweets.json" de los tags "love" y "#data" durante 60 segundos
filterStream("tweets.json", track = c("anishkapoor", "#arte"), timeout = 60, oauth = cred);

# Cargar el fichero el objeto para poder manipularlo posteriormente
tweets <- parseTweets("tweets.json", simplify = TRUE);

# Mostrar número de tweets obtenidos de cada tag buscado.
show(paste("Numero de tweets con anish:", length(grep("anishkapoor", tweets$text, ignore.case = TRUE))));
show(paste("Numero de tweets con #arte:", length(grep("#arte", tweets$text, ignore.case = TRUE))));