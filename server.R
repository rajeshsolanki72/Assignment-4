library(shiny)
library(ggplot2)
dataset = read.csv('Salary_Data.csv')
shinyServer(function(input, output) {
  
  model1 <- lm(Salary ~ YearsExperience, data = dataset)
  model1pred <- reactive({
    ExpInput <- input$sliderExp
    predict(model1, newdata = data.frame(YearsExperience = ExpInput))
  })
  

  output$plot1 <- renderPlot({
  ExpInput <- input$sliderExp

      plot(dataset$YearsExperience, dataset$Salary, xlab = "Years of Work Experience", 
      ylab = "Salary", bty = "n", pch = 19,
        xlim = c(0, 20), ylim = c(0, 220000))
  if(input$showModel1){
    abline(model1, col = "blue", lwd = 2)
   }

  points(ExpInput, model1pred(), col = "red", pch = 16, cex = 2)
 })
  
  output$pred1 <- renderText({
    paste("$", model1pred())
    })
  })
