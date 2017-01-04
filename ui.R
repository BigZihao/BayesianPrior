
# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyUI(fluidPage(

  # Application title
  titlePanel("Bayesian Example"),

  # Sidebar with a slider input for number of bins
  sidebarLayout(
  
    sidebarPanel(
      sliderInput("bins",
                  "Prior mean:",
                  min = 0,
                  max = 2,
                  value = 0.1,step=0.1),
  
      sliderInput("sd",
                  "Prior sd:",
                  min = 0.1,
                  max = 1,
                  value = 0.1,step=0.1)
  ),
    
    # Show a plot of the generated distribution
    mainPanel(
      h4("This is example showing how to affect inference and model fit by uisng different Prior"),
      plotOutput("distPlot"),
      plotOutput("dist")
    )
  )
))





