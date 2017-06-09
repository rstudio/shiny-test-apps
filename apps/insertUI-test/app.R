library(shiny)
library(DT)

# library(shinytest)
# recordTest("apps/insertUI-test")
# testApp("apps/insertUI-test")

# If you select rows when you run recordTest(), shinytest gets confused and even
# though it records the test and produces a tests directory, these are only for
# first snapshots (before clicking any rows and losing the rest of the information)
# 
# > recordTest("apps/insertUI-test")
# 
# Listening on http://127.0.0.1:7005
# Saved test code to /Users/barbaraborges/shinyTestResults/apps/insertUI-test/tests/mytests.R
# Saving baseline...
# Error in session_makeRequest(self, private, endpoint, data, params, headers) :
#   Unable to find input binding for element with id DataTables_Table_0_length
# > testApp("apps/insertUI-test")
# ====== Running mytests.R ======
#   Error in session_makeRequest(self, private, endpoint, data, params, headers) :
#   Unable to find input binding for element with id DataTables_Table_0_length

ui <- fluidPage(
  actionButton("add", "Add table", icon = icon("th")),
  tags$div(id = "tables")
)

server <- function(input, output, session) {
  observeEvent(input$add, {
    id <- paste0("slider-", input$add)
    insertUI("#tables", "beforeEnd", DT::dataTableOutput(id))
    output[[id]] <- DT::renderDataTable(head(mtcars, 3), server = FALSE)
  }, ignoreInit = TRUE)
}

shinyApp(ui, server)
