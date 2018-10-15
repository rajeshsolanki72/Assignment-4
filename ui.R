library(shiny)
shinyUI(fluidPage(
  titlePanel("Predict Salary with Experience"),
  sidebarLayout(
    sidebarPanel(
      sliderInput("sliderExp", "WHow many Years of Experience?", 1, 20, value = 1),
      checkboxInput("showModel1", "Show/Hide Model 1", value = TRUE)
     # submitButton("Submit")
    ),
    mainPanel(
      plotOutput("plot1"),
      h3("Predicted Salary from Linear Model:"),textOutput("pred1"),
      tags$head (tags$style("#pred1{color: blue;
                                 font-size: 20px;
                           font-style: bold;
                           }"))
  
    )
      
  )
)
)