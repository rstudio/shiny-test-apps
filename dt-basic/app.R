library(shiny)
  
ui <- fluidPage(
  DT::dataTableOutput("dt")
)

server <- function(input, output, session) {
  output$dt <- DT::renderDataTable(mtcars)
}

shinyApp(ui, server)