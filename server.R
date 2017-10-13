library(shiny)
library(tidyverse)

# data sources
dsa_legal_data <- readRDS("data/dsa_legal.rds")
dsa_etrf <- readRDS("data/dsa_etrf.rds")
cat(file=stderr(), "finished loading data",  "\n")

# source code to build the figures
source("scripts/helper_functions.R")
source("scripts/line_ETxMonths_2wateryears.R")
source("scripts/line_ETxMonths_cumulative.R")
source("scripts/etrf2.R")
cat(file=stderr(), "finished sourcing files", "\n")


# Define server logic for random distribution app ----
server <- function(input, output) {
  
  # generate text of the selected variables
  output$selected_var <- renderText({ 
    input$model_select
  })
  
  # render monthly line plot
  output$lineplot1 <- renderPlot({
    dsa_legal_data_sub <- dsa_legal_data %>% filter(model %in% c(input$model_select, "eto"))
    p <- line_ETxMonths_2wateryears(dsa_legal_data_sub, input$crop_select_1,  "dsa")
    p})
  
  
  # render cumulative plot
  output$cumulativeplot1 <- renderPlot({
    dsa_legal_data_sub <- dsa_legal_data %>% filter(model %in% c(input$model_select, "eto"))
    p <- line_ETxMonths_cumulative(dsa_legal_data_sub, input$crop_select_1,  "dsa")
    p})
 
  # render etrf plot
  output$etrf1 <- renderPlot({
    dsa_etrf_sub <- dsa_etrf %>% filter(model %in% c(input$model_select))
    cropname <- lookup_cropname(input$crop_select_1)
    p <- etrf2(dsa_etrf_sub, cropname)
    p})
  
}