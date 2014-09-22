
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(UsingR)
data(nym.2002)

shinyServer(function(input, output,clientData, session) {
  
  
  output$newHist <- renderPlot(function() {

    if(input$xhome == "All" & input$xgen == "All"){
        hist(nym.2002$age, xlab='Age', col='red',main='Histogram')
        ag <- input$ag
        lines(c(ag, ag), c(0, 200),col="blue",lwd=5)
        text(83, 200, paste("Age = ", ag))
      } else {
        if(input$xhome != "All") { 
          df <- subset(nym.2002, home == input$xhome )
          hist(df$age, xlab='Age', col='green',main=input$xhome)
          ag <- input$ag
          lines(c(ag, ag), c(0, 200),col="blue",lwd=5)
          text(83, 200, paste("Age = ", ag))
                                  } else {
          if(input$xgen != "All") {
            df <- subset(nym.2002, gender == input$xgen )
            hist(df$age, xlab='Age', col='coral',main=input$xgen)
            ag <- input$ag
            lines(c(ag, ag), c(0, 200),col="blue",lwd=5)
            text(83, 200, paste("Age = ", ag))
                                  }
                                        }
        
                                  }  
                         
  })
    
  
})


