# This is the user-interface definition of a Phishing Predictor Shiny web application.
library(shiny)
library(shinyBS)
library(ggplot2)
library(Cairo)
library(shiny)
library(e1071)
library(cluster)
library(shinyjs)
library(shinysky)
library(shinythemes)
library(neuralnet)
library(caret)
#setwd("~/Final Shiny App")
new_data <- read.csv("Data/dat.csv")
fluidPage(theme = shinytheme("united"),
          useShinyjs(),
          #Main GUI starts Here
          navbarPage("Phishing Predictor",id = "navbar",
                     tabPanel("Home",
                              tabPanel("Phishing Predictor",
                                       h2("About"),
                                       p("Welcome to the Phishing Predictor System!! It is a client server based architecture which categorizes phishing websites against the non-phishing ones based on a hybrid predictive model. Initially, user needs to upload the phishing website dataset."),
                                       p("The parameters in the dataset are analysed to generate a random forest classifier for categorizing phishing web pages. Once the model is developed, users can visualize several statistical metrics which reflects the accuracy of the classifier. At this stage, a hybrid model is proposed to further improve the predictive performance of random forest classifier. The hybrid model is developed using a feed forward neural network."),
                                       p("Once the hybrid model is developed, network administrator can upload phishing parameters observed in a website running on a browser to test its authenticity. The predictor system can also be implemented in a distributed fashion to aid parallel processing of phishing attacks. "),
                                       div(img(src = 'home.jpg', height = '650px', width = '920px',align='center'), style="text-align: center;")
                                       )
                              ),
                     #Random Forest Panel
                     tabPanel("Random Forest",
                              sidebarLayout(
                                sidebarPanel(
                                  actionButton("ropen","View Dataset",class = "btn-primary"),
                                  actionButton("summa","Dataset Details",class = "btn-primary"),
                                  actionButton("rnorm", "Build Model",class = "btn-primary"),
                                  numericInput("obs", "Number of observations to view:", 10),
                                  hr(),
                                  sliderInput("http", "Select HTTP Attribute:",min=-1, max=1, value=0),
                                  sliderInput("popUp", "Select popUp Attribute:",min=-1, max=1, value=0),
                                  sliderInput("doubles", "Select doubless Attribute:",min=-1, max=1, value=0),
                                  sliderInput("havingsd", "Select havingsd Attribute:",min=-1, max=1, value=0),
                                  sliderInput("Requesturl", "Select Requesturl Attribute:",min=-1, max=1, value=0),
                                  sliderInput("Onmouse", "Select Onmouse Attribute:",min=-1, max=1, value=0),
                                  selectInput("Result",label="Select Expected Result Attribute value",choices=list("Yes"="yes","No"="no" )),
                                  actionButton("saveuser","User Input",class = "btn-primary"),
                                  actionButton("predictres","Predict User Input",class = "btn-primary"),
                                  actionButton("ploter","ROC Plot",class = "btn-primary")
                                  ),
                                mainPanel(
                                  busyIndicator(wait = 0),
                                  tabsetPanel(id = "mainPane",
                                              tabPanel(value = "mytab1","View Dataset",div(h4("Dataset"),style="text-align: center;"),tableOutput('contents')),
                                              tabPanel(value = "mytab2","Dataset Details",div(h4("Dataset Details"),style="text-align: center;"), verbatimTextOutput("summary4")),
                                              tabPanel(value = "mytab3","Model Output", div(h4("Model Output"),style="text-align: center;"), verbatimTextOutput("summary2")),
                                              tabPanel(value = "mytab4","User Input",div(h4("User Input"),style="text-align: center;"), tableOutput('usercontent')),
                                              tabPanel(value = "mytab5","Predicted User Output",div(h4("Predicted User Output"),style="text-align: center;"), verbatimTextOutput("summary3")),
                                              tabPanel(value = "mytab6","Plot User Model",div(h4("Plot User Model"),style="text-align: center;"), div(img(src = 'ROC.png', height = '357px', width = '609px'), style="text-align: center;"))
                                              )
                                  )
                                )
                              ),
                     #Neural Net Panel
                     tabPanel("Hybrid Neural Network",
                              sidebarLayout(
                                sidebarPanel(
                                  actionButton("rrnorm", "Build Model",class = "btn-primary"),
                                  actionButton("ploters","NNet Plot",class = "btn-primary"),
                                  hr(),
                                  selectInput("Result11",label="Select Random forest input Attribute:",choices=list("1"="1","0"="0" )),
                                  selectInput("Result12",label="Select Actual value Attribute:",choices=list("1"="1","0"="0" )),
                                  actionButton("saveusers","User Input",class = "btn-primary"),
                                  actionButton("predictress","Predict User Input",class = "btn-primary")
                                  ),
                                mainPanel(
                                  busyIndicator(wait = 0),
                                  tabsetPanel(id = "mainPanek",
                                              tabPanel(value = "mytab33","Model Output", div(h4("Model Output"),style="text-align: center;"), verbatimTextOutput("summary22")),
                                              tabPanel(value = "mytab44","User Input",div(h4("User Input"),style="text-align: center;"), tableOutput('usercontentt')),
                                              tabPanel(value = "mytab55","Predicted User Output",div(h4("Predicted User Output"),style="text-align: center;"), verbatimTextOutput("summary33")),
                                              tabPanel(value = "mytab66","Plot User Model",div(h4("Plot User Model"),style="text-align: center;"), div(img(src = 'NNetF.png', height = '357px', width = '609px'), style="text-align: center;"))
                                              )
                                  )
                                )
                              )
                     )
          )