
# Pacotes Carregados -----

library(tidyverse)
library(shiny)
library(shinyWidgets)
library(fresh)

# Dados Carregados -----

source("Obtencao_Dados.R")

# Aparência ----

# create_theme(
#     theme = "default",
#     bs_vars_navbar(
#         default_bg = "#3f2d54",
#         default_color = "#FFFFFF",
#         default_link_color = "#FFFFFF",
#         default_link_active_color = "#FFFFFF"
#     ),
#     bs_vars_color(
#         gray_base = "#354e5c",
#         brand_primary = "#75b8d1",
#         brand_success = "#c9d175",
#         brand_info = "#758bd1",
#         brand_warning = "#d1ab75",
#         brand_danger = "#d175b8"
#     ),
#     bs_vars_state(
#         success_text = "#FFF",
#         success_bg = "#c9d175",
#         success_border = "#c9d175",
#         info_text = "#FFF",
#         info_bg = "#3f2d54",
#         info_border = "#3f2d54",
#         danger_text = "#FFF",
#         danger_bg = "#d175b8",
#         danger_border = "#d175b8"
#     ),
#     bs_vars_wells(
#         bg = "#FFF",
#         border = "#3f2d54"
#     ),
#     output_file = "www/mytheme.css"
# )

ui <- fluidPage(

    # Application title
    titlePanel(img(src = "data:image/png;base64,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")),
    
    # Sidebar with a slider input for number of bins 
    sidebarLayout(
        sidebarPanel(
            
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
                status = "success",
                outline = TRUE,
                animation = "jelly"
            ),
            
            actionBttn(
                inputId = "start",
                label = "Sorteia!",
                style = "float", 
                color = "danger"
            )
        ),

        # Show a plot of the generated distribution
        mainPanel(
           tableOutput("titulo")
        )
    )
)

# Define server logic required to draw a histogram
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

    output$titulo <- renderTable({
        
        if (input$start == FALSE) return()
        
        episodio()

    })
    
    # output$imagem <- render({})
}

# Run the application 
shinyApp(ui = ui, server = server)
