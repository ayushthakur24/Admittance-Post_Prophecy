library(shiny)
library(shinydashboard)

shinyServer(function(input, output, session){
 
 
  output$contents <- renderTable({
    
    # input$file1 will be NULL initially. After the user selects
    # and uploads a file, head of that data file by default,
    # or all rows if selected, will be shown.
    
    req(input$file1)
    
    df <- read_excel(input$file1$datapath)
    
    if(input$disp == "head") {
      return(head(df))
    }
    else {
      return(df)
    }
    
  })
  
  output$distPlot <- renderPlot({
    
    #creating distPlot
    if(input$s=='a1') { i<-7 }
    if(input$k=='a2') { j<-2 }
    if(input$k=='b2') { j<-3 }
    if(input$k=='c2') { j<-4 }
    if(input$k=='d2') { j<-5 }
   
    
    train<-read.csv("train.csv")
    X    <- train[, i]
    Y    <- train[, j]
    plot(X,Y)
  })
  
})
