library(httr)
library(jsonlite)
library(tidyverse)

url1 <- "http://www.omdbapi.com/?apikey=369c6b9a&t=The+Office"
url2 <- "http://www.omdbapi.com/?apikey=369c6b9a&t=The+Office&season="

geral <- fromJSON(url1)
poster_geral <- geral$Poster
num_temp <- as.numeric(geral$totalSeasons)

####### TAREFAS ########
# 1. Como vou arrumar com as imagens?
# 2. Qual o pacote que mostra imagens mesmo?
# 3. Faço o esforço de adicionar os episódios faltantes?
# 4. Pensar em Inputs de letras bonitas
# 5. Coloco alguma música?
# 6. Não esquecer da logo do DunderMifflin

temporada1 <- fromJSON(paste(url2, 1, sep = ''))$Episodes
temporada2 <- fromJSON(paste(url2, 2, sep = ''))$Episodes
temporada3 <- fromJSON(paste(url2, 3, sep = ''))$Episodes # Faltam 2
temporada4 <- fromJSON(paste(url2, 4, sep = ''))$Episodes # Faltam 5
temporada5 <- fromJSON(paste(url2, 5, sep = ''))$Episodes 
temporada6 <- fromJSON(paste(url2, 6, sep = ''))$Episodes
temporada7 <- fromJSON(paste(url2, 7, sep = ''))$Episodes # Faltam 2
temporada8 <- fromJSON(paste(url2, 8, sep = ''))$Episodes
temporada9 <- fromJSON(paste(url2, 9, sep = ''))$Episodes # Faltam 2