
# Pacotes Carregados -----

library(tidyverse)
library(shiny)
library(shinyWidgets)
library(shinycssloaders)

# Dados Carregados -----

source("Obtencao_Dados.R")

# Aplicativo ----

ui <- fluidPage(

    # Application title
    titlePanel(img(src = "https://i.ibb.co/z4Ctk6d/header.png", style = "margin-left: 400px; width: 800px")),
    
    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            style = "float: left; margin-right: 100px; text-align: center",
            
            prettyCheckboxGroup(
                inputId = "temporadas",
                label = "Escolha as temporadas de interesse:", 
                choices = c("Temporada 1", "Temporada 2", "Temporada 3", "Temporada 4",
                            "Temporada 5", "Temporada 6", "Temporada 7", "Temporada 8",
                            "Temporada 9"),
                selected = c("Temporada 1", "Temporada 2", "Temporada 3", "Temporada 4",
                             "Temporada 5", "Temporada 6", "Temporada 7", "Temporada 8",
                             "Temporada 9"),
                icon = icon("check-square-o"),
                status = "primary",
                outline = TRUE,
                animation = "jelly"
            ),
            
            actionBttn(
                inputId = "start",
                label = "Sorteia!",
                style = "unite", 
                color = "primary"
            )
        ),

        mainPanel(
            
            withSpinner(uiOutput("imagem")),
            
            span(textOutput("titulo"), style = "font-size:30px; font-style: bold; font-weight: bolder;"),
            
        )
    )
)

server <- function(input, output) {
    
    sorteado <- eventReactive(input$start, {
        
        escolhidos <- str_sub(input$temporadas, start = 11)
        tamanho <- geral %>% filter(temp %in% escolhidos)
        tamanho <- dim(tamanho)[1]
        sample(tamanho, 1)
        
    })
    
    episodio <- reactive({
        
        escolhidos <- str_sub(input$temporadas, start = 11)
        
        geral %>% filter(temp %in% escolhidos) %>% slice(sorteado())

    })

    output$titulo <- renderText({
        
        if (input$start == FALSE) return()
        
        paste0("S0", episodio() %>% pull(temp),
               "EP", episodio() %>% pull(Episode),
               " - Título = ", episodio() %>% pull(Title))

    })
    
    output$imagem <- renderUI({

        if (input$start == FALSE) return(tags$img(src = "https://i.ibb.co/941V8Sm/1.png", style = "width: 650px"))

        tags$img(src = episodio() %>% pull(imagem), style = "width: 650px")

    })
}

shinyApp(ui = ui, server = server)
