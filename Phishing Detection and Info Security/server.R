# This is the user-interface definition of a Phishing Predictor Shiny web application.
library(shiny)
library(e1071)
library(cluster)
library(party)
library(pROC)
library(caret)
library(shinyjs)
library(shinysky)
library(shinythemes)
library(randomForest)
library(neuralnet)
library(caret)
#setting working directory and dataset for model
setwd("~/Final Shiny App")
new_data <- read.csv("Data/dat.csv")
sample <- sample.int(n = nrow(new_data), size = floor(.75*nrow(new_data)), replace = F)
train <- new_data[sample, ]
test  <- new_data[-sample, ]
datnew <- new_data[,4:7]
datanew1 <- new_data[,7]
load(file = "Model/forest.model1.rda")
load(file = "Model/nn_model.rda")
function(input, output, session) {
  #Taking Input from User
  test<-reactive({
    observe({
      x <-data.frame(
        http = as.numeric(input$http),
        popUp = as.numeric(input$popUp),
        doubless = as.numeric(input$doubless),
        havingsd = as.numeric(input$havingsd),
        Requesturl = as.numeric(input$Requesturl),
        Onmouse = as.numeric(input$Onmouse),
        Result = as.numeric(input$Result)
        )
      })
    })
  
  #reading CSV File
  data1 <- reactive({
    file1 <- input$file1
    if(is.null(file1)){return()} 
    read.table(file=file1$datapath, sep=input$sep, header = input$header, stringsAsFactors = input$stringAsFactors)
    })
  
  #Projecting CSV Contents to RenderTable
  showtab<-reactive({
    output$contents <- renderTable({
      new_data <- read.csv("Data/dat.csv")
      head(new_data, n = input$obs)
    })
    })
  
  #Printing New Data
  showtab1<-reactive({
    output$summary4 <- renderPrint({
      summary(datnew)
    })
  })
  
  #Saving Data file path for further use in model
  output$contents <- renderTable({
    inFile <- input$file1
    if (is.null(inFile))
      return(NULL)
    read.csv(inFile$datapath)
    head(new_data, n = input$obs)
  })
  
  #Naive Bayes Model
  observe({
    values <- reactiveValues()
    results12 <- reactive({
      forest.model <- train(Result ~., train)
      result1<-print(forest.model)
      })
    }) 
  
  #Printing Naive Bayes Model
  results13<-reactive({
    output$summary2 <- renderPrint({
      result1<-load(file = "Model/forest.model1.rda")
      print(forest.model)
      print("Random Forest Model Built" , width="25px")
      showModal(modalDialog(
        title = "Important message",
        "Random Forest Model Built- Go to Model TAB!",
        easyClose = TRUE,
        footer = NULL
        ))
      })
    })
  
  #Empty Function
  showtab5<-reactive({
     })
   
  #Taking user input as test data
  sliderValues <- reactive({
    # Compose data frame
    testdata<-data.frame(
      http = as.numeric(input$http),
      popUp = as.numeric(input$popUp),
      doubles = as.numeric(input$doubles),
      havingsd = as.numeric(input$havingsd),
      Requesturl = as.numeric(input$Requesturl),
      Onmouse = as.numeric(input$Onmouse),
      Result = as.character(input$Result)
      )
  })
  
  #Projecting user input as table
  showtab4<-reactive({
    output$usercontent<-renderTable({
      sliderValues()
    })
  })
  
  #converting user input to data frame for model input
  observe({
    x<-as.data.frame(sliderValues())
  })
  
  #Predicting for user input
  showtab3<-reactive({
    output$summary3 <- renderPrint({
      x<-as.data.frame(sliderValues())
      result.predicted<- predict(forest.model, x, type="prob")
      result132<-print(result.predicted)
      })
    })

  #Button Click Event registering and Updating corresponding Panel
  observeEvent(input$rnorm,{
    updateTabsetPanel(session, "mainPane", selected = "mytab3")
  })
  
  observeEvent(input$ropen, {
    updateTabsetPanel(session, "mainPane", selected = "mytab1")
  })
  
  observeEvent(input$summa, {
    updateTabsetPanel(session, "mainPane", selected = "mytab2")
  })
  
  observeEvent(input$predictres, {
    updateTabsetPanel(session, "mainPane", selected = "mytab5")
  })
  
  observeEvent(input$saveuser, {
    updateTabsetPanel(session, "mainPane", selected = "mytab4")
  })
  
  observeEvent(input$ploter, {
    updateTabsetPanel(session, "mainPane", selected = "mytab6")
  })
  
  observeEvent(input$rrnorm, {
    updateTabsetPanel(session, "mainPanek", selected = "mytab33")
  })
  
  observeEvent(input$ploters, {
    updateTabsetPanel(session, "mainPanek", selected = "mytab66")
  })
  
  observeEvent(input$saveusers, {
    updateTabsetPanel(session, "mainPanek", selected = "mytab44")
  })
  
  observeEvent(input$predictress, {
    updateTabsetPanel(session, "mainPanek", selected = "mytab55")
  })
  
  #Neural Net Prediction for user input
  showtab33<-reactive({
    output$summary33 <- renderPrint({
      x<-as.data.frame(sliderValues1())
      result.predicted<- compute(nn, x[,-3])$net.result
      maxidx <- function(arr) {
        return(which(arr == max(arr)))
      }
      idx <- apply(result.predicted, c(1), maxidx)
      prediction <- c('1', '0')[idx]
      showModal(modalDialog(
        title = "Neural Net Prediction",
        "1 = Probable phishing website.",
        br(),
        "0 = Probable non-phishing website",
        hr(),
        print("Neural Net Prediction is :",prediction),
        print(prediction, digits=1),
        easyClose = TRUE,
        footer = NULL
        ))
      })
    })
  
  #Empty function
  showtab55<-reactive({
  })
  
  #taking user values as numeric input for neural net model
  sliderValues1 <- reactive({
    testdata<-data.frame(
      RF_outcome = as.numeric(input$Result11),
      expected = as.numeric(input$Result12)
      )
    })
  
  #projecting user input for neural net model
  showtab44<-reactive({
    output$usercontentt<-renderTable({
      sliderValues1()
    })
  })
  
  #Neural NEt model Building
  results113<-reactive({
    output$summary22 <- renderPrint({
      result1<-load(file = "Model/nn_model.rda")
      print(nn)
      print("Neural Net" , width="25px")
      showModal(modalDialog(
        title = "Important message",
        "Neural Net Model Built!!!",
        easyClose = TRUE,
        footer = NULL
        ))
      })
    })

  #Onclick button events Random Forest
  onclick("rnorm", results13())
  onclick("ropen",showtab())
  onclick("summa",showtab1())
  onclick("predictres",showtab3())
  onclick("saveuser",showtab4())
  onclick("ploter",showtab5())
  
  #Onclick button events Neural Net
  onclick("rrnorm", results113())
  onclick("ploters",showtab55())
  onclick("saveusers",showtab44())
  onclick("predictress",showtab33())

}