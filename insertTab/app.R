
library(shiny)

cond <- function(actions, comparator, join = "") {
  conds <- lapply(as.list(actions), function(action) {
    paste0("input.action", comparator, "'", action, "'")
  })
  paste(conds, collapse = join)
}

ui <- navbarPage("Dynamic tabs", id = "navbarPage",
  theme = shinythemes::shinytheme("flatly"),
  footer = sidebarLayout(
    sidebarPanel(
      selectInput("action", "Choose tab action",
        c("insert", "prepend", "append", "remove", "hide", "show"),
        selected = "append"),
      radioButtons("tabset", "Choose tabset", 
        c("navbarPage", "tabsetPanel_tabs", "tabsetPanel_pills", "navlistPanel")
      ),
      conditionalPanel(
        cond(list("insert", "prepend", "append"), " == ", " || "),
        textInput("tab", "Tab argument (see Suggestions on the side)")
      ),
      conditionalPanel(
        cond("insert", " == "),
        radioButtons("position", "Position in relation to target", c("before", "after"))
      ),
      conditionalPanel(
        cond(list("insert", "prepend", "append", "show"), " == ", " || "),
        checkboxInput("select", "Select (should target be selected)?")
      ),
      conditionalPanel(
        cond(list("prepend", "append"), " != ", " && "),
        textInput("target", "Target (data-value of target tab)")
      ),
      conditionalPanel(
        cond(list("prepend", "append"), " == ", " || "),
        textInput("menuName", "menuName (if you want to prepend/append a tab to a navbarMenu)")
      ),
      actionButton("go", "Go"),
      hr(),
      uiOutput("tab_navbarPage"),
      uiOutput("tab_tabsetPanel_tabs"),
      uiOutput("tab_tabsetPanel_pills"),
      uiOutput("tab_navlistPanel")
    ),
    mainPanel(
      checkboxInput("show", "Show suggestions below"),
      conditionalPanel("input.show === false",
        helpText("Click above for some copy-pasteable examples of valid tab insertions")
      ),
      hr(),
      conditionalPanel("input.show",
        h4("Suggestions"),
        tags$ul(
          tags$li("Standard tabPanel item: ", 
            pre('tabPanel("Test", "Test page")'),
            br()
          ),
          tags$li("navbarMenu item: ", 
            pre(
              'navbarMenu("Dropdown",
              tabPanel("Drop1", "Drop1 page"),
              tabPanel("Drop2", "Drop2 page"),
              "------",
              "Header",
              tabPanel("Drop3", "Drop3 page")
            )'),
              br()
          ),
          tags$li("Plain text item ", 
            em("(should only be placed inside a dropdownmenu)"), ":",
            pre("Text")
          )
          ),
        hr()
      ),
      tabsetPanel(
        tabPanel("tabsetPanel_tabs",
          tabsetPanel(id = "tabsetPanel_tabs",
            tabPanel("Tabs1", "This is the Tabs1 tab"),
            tabPanel("Tabs2", "This is the Tabs2 tab"),
            tabPanel("Tabs3", "This is the Tabs3 tab")
          )
        ),
        tabPanel("tabsetPanel_pills",
          tabsetPanel(id = "tabsetPanel_pills", type = "pills",
            tabPanel("Pills1", "This is the Pills1 tab"),
            tabPanel("Pills2", "This is the Pills2 tab"),
            tabPanel("Pills3", "This is the Pills3 tab")
          )
        ),
        tabPanel("navlistPanel",
          navlistPanel(id = "navlistPanel",
            "navlistPanel Header",
            tabPanel("Navlist1", "This is the Navlist1 tab"),
            tabPanel("Navlist2", "This is the Navlist2 tab"),
            tabPanel("Navlist3", "This is the Navlist3 tab")
          )
        )
      )
    )
  ),
  tabPanel("Main", "Main panel"),
  tabPanel("Simple", "Simple tabPanel"),
  navbarMenu("More",
    tabPanel("Table", "Table page"),
    tabPanel("About", "About page"),
    "------",
    "Even more!",
    tabPanel("Email", "Email page")
  )
)

server <- function(input, output, session) {
  
  observeEvent(input$go, {
    tab = eval(parse(text = input$tab)) 
    menuName = if (input$menuName == "") NULL else input$menuName
    
    switch(input$action,
      insert  = insertTab( input$tabset, tab, input$target, input$position),
      prepend = prependTab(input$tabset, tab, input$select, menuName),
      append  = appendTab( input$tabset, tab, input$select, menuName),
      remove  = removeTab( input$tabset, input$target),
      hide    = hideTab(   input$tabset, input$target),
      show    = showTab(   input$tabset, input$target, input$select)
    )
  })
  
  output$tab_navbarPage <- renderUI({
    div(code("input$navbarPage:"), input$navbarPage, style = "padding-bottom: 10px;")
  })
  
  output$tab_tabsetPanel_tabs <- renderUI({
    div(code("input$tabsetPanel_tabs:"), input$tabsetPanel_tabs, style = "padding-bottom: 10px;")
  })
  
  output$tab_tabsetPanel_pills <- renderUI({
    div(code("input$tabsetPanel_pills:"), input$tabsetPanel_pills, style = "padding-bottom: 10px;")
  })
  
  output$tab_navlistPanel <- renderUI({
    div(code("input$navlistPanel:"), input$navlistPanel, style = "padding-bottom: 10px;")
  })
}

shinyApp(ui, server)
