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

imagens <- data.frame(temp = as.character(1:9),
                      imagem = c("https://images-na.ssl-images-amazon.com/images/S/pv-target-images/278528df7eb08b4e1d09281cf8fddec21f9a58288a232423e4d65c1258a3ca1a._RI_V_TTW_.jpg",
                                 "https://images-na.ssl-images-amazon.com/images/S/pv-target-images/1258b0e14ccd79bfe1624be6355a29f90f490a92e52060e9e977921053fce7ea._RI_V_TTW_.jpg",
                                 "https://images-na.ssl-images-amazon.com/images/S/pv-target-images/2d358f2d255637d31ca7880cb0573e11c1aefa6a146221139ce1d02407304c61._RI_V_TTW_.jpg",
                                 "http://br.web.img2.acsta.net/pictures/20/08/16/19/11/0428207.jpg",
                                 "https://images-na.ssl-images-amazon.com/images/I/51Slake1xDL._AC_SY445_.jpg",
                                 "https://static.wikia.nocookie.net/theoffice/images/b/b4/250px-TheOffice_S6_DVD.jpg/revision/latest/top-crop/width/360/height/360?cb=20200714002248",
                                 "https://images-na.ssl-images-amazon.com/images/I/51V0BCZiznL._AC_SY445_.jpg",
                                 "http://br.web.img3.acsta.net/pictures/20/08/16/19/55/5474261.jpg",
                                 "https://static.wikia.nocookie.net/theoffice/images/9/9c/The_Office_Season_9.jpg/revision/latest/top-crop/width/360/height/360?cb=20200610120310"))


geral <- rbind(temporada1 %>% mutate(temp = "1"), 
               temporada2 %>% mutate(temp = "2"), 
               temporada3 %>% mutate(temp = "3"), 
               temporada4 %>% mutate(temp = "4"), 
               temporada5 %>% mutate(temp = "5"), 
               temporada6 %>% mutate(temp = "6"),
               temporada7 %>% mutate(temp = "7"), 
               temporada8 %>% mutate(temp = "8"), 
               temporada9 %>% mutate(temp = "9"))

tamanhos <- c(dim(geral)[1])
for (i in 1:9){
  tamanhos <- c(tamanhos, dim(geral %>% filter(temp == i))[1])
}




