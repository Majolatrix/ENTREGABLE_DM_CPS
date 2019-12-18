#Obtenido de http://www.diegocalvo.es/obtener-datos-de-twitter-con-r-usando-su-api/
# Cargar la librería específica de TwitterR
library(twitteR);

# Leer el fichero de credenciales creado anteriormente, ¡cuidado con la ruta del fichero!.
source('credenciales.R')

# Función que permite buscar: #hashtag, @usuarios, palabras
tweets <- searchTwitter("anishkapoor", n=25, lang="es")

# Quedarse solo con el primer tweet para datos concretos del mismo
tweet <- tweets[[1]];

# Mostrar la estructura del tweet
str(tweet)

# Obtener el texto del tweet:
tweet$getText()

# Obtener información acerca del usuario:
usuario <- getUser(tweet$getScreenName());

# Mostrar la estructura del usuario
str(usuario)

# Obtener el nombre del usuario
usuario$getName()