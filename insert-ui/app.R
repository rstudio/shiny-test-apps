
library(shiny)

ui <- fluidPage(
  actionButton("add", "Add slider"),
  tags$div(id = "sliders")
)

server <- function(input, output, session) {
  observeEvent(input$add, {
    containerID <- paste0("ui-", input$add)
    sliderID <- paste0("slider-", input$add)
    insertUI("#sliders", "beforeEnd", uiOutput(containerID))
    output[[containerID]] <- renderUI(sliderInput(sliderID, sliderID, 0, 10, 5))
  }, ignoreInit = TRUE)
}

shinyApp(ui, server)
