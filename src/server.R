
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
