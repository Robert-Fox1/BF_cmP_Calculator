library(shiny)
library(shinythemes)
library(rmarkdown)

ui <- shinyUI(fluidPage(theme = shinytheme("flatly"),  
#  titlePanel(title = "BF & cmP Calculator"), 
  navbarPage("BF & cmP Calculator", 
    tabPanel("Calculator",
    sidebarLayout(
    
    sidebarPanel(tags$h4(strong("Bayes Factor (BF) and Approximate Correct Model Probability (cmP) Calculator")),
                div(style = "margin-top: 30px"),
                tags$h5(strong("Instructions:")),
                tags$h5("All you need to calculate the BF and cmP values are the Bayesian Information Criterion (BIC) values for each model tested."), 
                div(style = "margin-top: 20px"),
                tags$h5("Please enter the number of models you wish to compare."), 
                 numericInput("rows","Number of models tested",value = 1,min=1, max=100),
                div(style = "margin-top: 30px"),
                tags$h5("Next, enter each of the BIC values from your output."), 
                tags$h5("Once you have entered the BIC values, the BF and cmP values will be estimated. You can view these by switching to the 'BF Values' tab and the 'cmP Values' tab."), 
                ),
    
    mainPanel(tabsetPanel(
              tabPanel(strong("BIC Values"),
                      div(style = "margin-top: 20px"),
                      uiOutput("Num.Models")
                      ),
              tabPanel(strong("BF Values"), 
                      div(style = "margin-top: 20px"),
                      strong("Bayes Factor values"), 
                      div(style = "margin-top: 0px"),
                      strong("(rounded to 5 decimal places)"),
                      div(style = "margin-top: 20px"),
                      tableOutput('table.BF')),
              tabPanel(strong("cmP Values"), 
                       div(style = "margin-top: 20px"),
                       strong("Approximate Correct Model Probability values"),
                       div(style = "margin-top: 0px"),
                       strong("(rounded to 5 decimal places)"),
                        div(style = "margin-top: 20px"), 
                        tableOutput('table.cmP'))
              ))
              
    )),
  tabPanel("About",
           titlePanel(strong("About")), 
           div(includeMarkdown("About.md"), 
               align="justify"))
  )))  

server <- function(input,output){
  
  # creating input widgets dynamically
  output$Num.Models <- renderUI({
    rows <- as.integer(input$rows) #input value (i.e., number of rows selected)
    if (is.na(rows)){print("")}
     else {
    if (rows > 0 & rows <= 100){
    lapply(1:rows, function(i) {
      numericInput(paste0("Model_", i), label = paste0("Model ", i), value = 0)
    })
    } else {
      print("A value between 1-100 must be selected")
    }
    }
  })
  

  # capturing the value of input widgets 
  selectedData <- reactive({
    rows <- as.integer(input$rows)
    
    data.frame(lapply(1:rows, function(i) {
      input[[paste0("Model_", i)]]
    }))
  })
  
  
  
  ## Bayes Factor Function 
  Bayes.Factor <- function(Bic.Val) {
    x <- numeric(length(Bic.Val)-1)
    for(i in 1:(length(Bic.Val)-1)) {
      BicA <- Bic.Val[i]
      BicB <- Bic.Val[i+1]
      SicA <- -.5*BicA
      SicB <- -.5*BicB
      x[i] <- exp(SicA - SicB)}
    
    return(x)
  }
  

    
## Correct Model Probability (cmP) 
  
  CMP <- function(Bic.Val){
    Sic.Val <- -.5*Bic.Val 
    max.Sic <- max(Sic.Val)
    x <- numeric(length(Sic.Val))
    sumJ <- function(Sic.Val){
      D <- numeric(length(Sic.Val))
      for(i in 1:length(Sic.Val)) {
        D[i] <- (exp(Sic.Val[i] - max.Sic)) # D = Denominator 
      }
      return(sum(D))
    }
    for(k in 1:length(Sic.Val)) {
      x[k] <- (exp(Sic.Val[k] - max(Sic.Val))) / (sumJ(Sic.Val))
    }
    return(x)
  }
 
   
  
  #BFs 
  
  output$table.BF <- renderTable(matrix(Bayes.Factor(selectedData())),  bordered = T, striped = T, hover = T, digits = 5, rownames = T, colnames = F, spacing = "m")
  
  
  #cmPs 
 
  output$table.cmP <- renderTable(CMP(as.numeric(selectedData())),  bordered = T,  striped = T, hover = T, digits = 5, rownames = T, colnames = F, spacing = "m") 
  
}
  

shinyApp(ui,server) 