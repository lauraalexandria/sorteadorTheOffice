library(httr)
library(jsonlite)
library(tidyverse)

url1 <- "http://www.omdbapi.com/?apikey=369c6b9a&t=The+Office"
url2 <- "http://www.omdbapi.com/?apikey=369c6b9a&t=The+Office&season="

geral <- fromJSON(url1)
poster_geral <- geral$Poster
num_temp <- as.numeric(geral$totalSeasons)

####### TAREFAS ########
# 3. Faço o esforço de adicionar os episódios faltantes?

temporada1 <- fromJSON(paste(url2, 1, sep = ''))$Episodes
temporada2 <- fromJSON(paste(url2, 2, sep = ''))$Episodes
temporada3 <- fromJSON(paste(url2, 3, sep = ''))$Episodes # Faltam 2
temporada4 <- fromJSON(paste(url2, 4, sep = ''))$Episodes # Faltam 5
temporada5 <- fromJSON(paste(url2, 5, sep = ''))$Episodes 
temporada6 <- fromJSON(paste(url2, 6, sep = ''))$Episodes
temporada7 <- fromJSON(paste(url2, 7, sep = ''))$Episodes # Faltam 2
temporada8 <- fromJSON(paste(url2, 8, sep = ''))$Episodes
temporada9 <- fromJSON(paste(url2, 9, sep = ''))$Episodes # Faltam 2

imagens <- data.frame(temp = as.character(1:9),
                      imagem = c("https://i.ibb.co/SxDZC3m/2.png",
                                 "https://i.ibb.co/YRvG5Rw/3.png",
                                 "https://i.ibb.co/QDDPFmC/4.png",
                                 "https://i.ibb.co/KKHQ2Hx/5.png",
                                 "https://i.ibb.co/tH5HLzd/6.png",
                                 "https://i.ibb.co/4m0gPxx/7.png",
                                 "https://i.ibb.co/WG4qjBd/8.png",
                                 "https://i.ibb.co/kcmst7Q/9.png",
                                 "https://i.ibb.co/XJLvXjM/10.png"))


geral <- rbind(temporada1 %>% mutate(temp = "1"), 
               temporada2 %>% mutate(temp = "2"), 
               temporada3 %>% mutate(temp = "3"), 
               temporada4 %>% mutate(temp = "4"), 
               temporada5 %>% mutate(temp = "5"), 
               temporada6 %>% mutate(temp = "6"),
               temporada7 %>% mutate(temp = "7"), 
               temporada8 %>% mutate(temp = "8"), 
               temporada9 %>% mutate(temp = "9"))

geral <- geral %>% left_join(imagens)




