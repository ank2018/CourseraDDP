#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

data(mpg)

# Define UI for application that draws a histogram
shinyUI(fluidPage(
  
  # Application title
  titlePanel("Analyze mpg Dataset in ggplot2 R package based on the Car Manufacturers for timeframe (1999-2008)"),
  br(),
  br(),
  
  # Sidebar with a slider input for car manufacturers in the mpg dataset
  sidebarLayout(
    sidebarPanel(
      
      selectInput("var", label = "Select the Manufacturer from the Drop Down List and click on the show button.", choices = mpg$manufacturer),
      submitButton("show"),
      helpText("Plot and Data will be created based on the criteria selected to review the efficiency."),
      helpText("Tab 1 contains the Plot that shows effeciency for Displacement vs Highway for the model selected."),
      helpText("Tab 2 contains the Table data for the car manufacturer selected."),
      helpText("Tab 3 contains the Plot for all the car models in the dataset."),
      helpText("mpg dataset provides the fuel economy for car manufacturers for the 1999-2008 timeframe.")),
    
    mainPanel(
      tabsetPanel(
        tabPanel("Model Specific Plot",plotOutput("plot1",width = "100%")),
        tabPanel("Data",dataTableOutput('Details')),
        tabPanel("Complete Plot",plotOutput("plot2",width = "100%"))
      )
    )
  )
))