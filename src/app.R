library(shinydashboard)

ui <- dashboardPage (
  dashboardHeader(title = "Meu Dashboard", 
                  dropdownMenu(type = "messages", #escolha entre “messages”, “notifications”, “tasks”
                               messageItem(
                                 from = "Depto de Vendas",
                                 message = "As vendas estão estáveis este mês."
                               ),
                               messageItem(
                                 from = "Novo usuário",
                                 message = "Como eu me registro?",
                                 icon = icon("question"),
                                 time = "13:45"
                               ),
                               messageItem(
                                 from = "Suporte",
                                 message = "O novo servidor está pronto.",
                                 icon = icon("life-ring"),
                                 time = "2021-12-01"
                               )
                  )
                  
                  
  ),
  ## Conteúdo do Sidebar
  dashboardSidebar(
    sidebarMenu(
      menuItem("Alugueis", tabName = "dashboard", icon = icon("dashboard")),
      menuItem("Widgets", tabName = "widgets", icon = icon("th"))
    )
    
  ),
  ## Conteúdo do body
  dashboardBody(
    tabItems(
      # Conteúdo da pág. Dashboard
      tabItem(tabName = "dashboard",
              fluidRow(
                box(plotOutput("plot1", height = 250)),
                
                box(
                  title = "Controle",
                  sliderInput("slider", "Número de observações:", 1, 500, 250)
                ),
              ),
      ),
      
      # Conteúdo da pág Widgets
      tabItem(tabName = "widgets",
              fluidRow(
                box(plotOutput("plot2", height = 250)),
                
                box(
                  title = "Escolha o poluente",
                  selectInput("select", "Poluente:", 
                              choices=colnames(pollution_records)),
                ),
              ),
      )
    )
  ),
)

server <- function(input, output) {
  histdata<-apenas_alugueis$Price
  
  output$plot1 <- renderPlot({
    data <- histdata[seq_len(input$slider)]
    hist(data, main = paste("Histograma de Preços"), xlab = "Preço", ylab = "Frequência")
    
  })
  
  output$plot2 <- renderPlot({
    
    # Renderizar o barplot
    barplot(pollution_records[,input$select], 
            main=input$select,
            ylab="Valor",
            xlab="Ano")
  }) 
}

shinyApp(ui, server)
