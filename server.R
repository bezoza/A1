
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(UsingR)
data(nym.2002)



shinyServer(function(input, output,clientData, session) {
  
  output$filter1 <- renderUI({
    selectInput("filter1", label="Gen:", choices = c("All", unique(as.character(nym.2002$gender)))
                , selectize = TRUE)   
  })
  
  
  output$newHist <- renderPlot({

  
  
  #if (input$xgen != "All") {
    
    #df <- subset(nym.2002, gender == "Male") 
    #hist(df$age, xlab='Age', col='red',main='Histogram') }
    

    # draw the histogram   
    hist(nym.2002$age, xlab='Age', col='coral',main='Histogram')
    ag <- input$ag
    lines(c(ag, ag), c(0, 200),col="blue",lwd=5)
    text(63, 150, paste("Age = ", ag))
         
  })

})
