
####httpuv::runStaticServer("docs")
####shinylive::export(appdir = "../Macro_App/", destdir = "docs")





library(shiny)
#library(tidyverse) #ganze tidyverse klappt nicht mit shinylive 
library(shinylive) #um shiny app auf static github page zu hosten 
library(httpuv)
library(bslib)

# Define UI for application that draws a histogram
ui <- fluidPage(
  navset_tab(
    nav_panel(title = "Inflation", 
              fluidRow(
                column(6, plotOutput("inflation_plot"))
              )),
    
    nav_panel(title = "GDP", "HIER KOMMT WAS HIN"),
    nav_panel(title = "Unemployment", "Here comes the Unemployment content")
  )
)


# Define server logic required to draw a histogram
server <- function(input, output) {
  source("plots_GDP.R", local = TRUE)
  
}

# Run the application 
shinyApp(ui = ui, server = server)










