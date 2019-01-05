#
# This is the server logic of a Shiny web application. You can run the 
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
# 
#    http://shiny.rstudio.com/
#

library(shiny)
library(datasets)
library(dplyr)
library(ggplot2)

shinyServer(function(input, output) {
  output$plot1 <- renderPlot({
    qplot(filter(mpg,
                 manufacturer==input$var)$displ,
          filter(mpg,manufacturer==input$var)$hwy,
          main = "Displacement vs Highway Efficiency" , xlab = "Engine Displacement in Liters", ylab = "Highway Mileage")
  })
  
  output$Details <- renderDataTable({
    filter(mpg,manufacturer==input$var)
  },
  br(),
  br())
  
  output$plot2 <- renderPlot({
    ggplot(data = mpg, mapping = aes(x = mpg$displ, y = mpg$hwy)) + geom_point(mapping = aes(color = mpg$drv)) + geom_smooth()
  })
  
})
