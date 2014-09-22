# This is the user-interface definition of a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)
library(UsingR)
data(nym.2002)

shinyUI(fluidPage(

  # Application title
  titlePanel("Random sample of 2002 New York City Marathon finishers"),
  
  
  fluidRow(style = "padding-bottom: 20px;",
           
           column(2,selectInput("xhome", label = h4("Select a Nation"), 
                       choices = c("All", unique(as.character(nym.2002$home))), selected = "All")),
           column(2,selectInput("xgen", label = h4("Select a Gender"), 
                                choices = c("All", unique(as.character(nym.2002$gender))), selected = "All")),  
  
  # Sidebar with a slider input 
  sidebarLayout(
    sidebarPanel(
      sliderInput("ag",
                  label = h4("Age on day of race:"),
                  min = min (nym.2002$age),
                  max = max (nym.2002$age),
                  value = mean (nym.2002$age))
    ),
   
    # Show a plot of the generated distribution
    mainPanel(
      plotOutput("newHist")
    )
  )
  )))
