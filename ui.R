library(shiny)
shinyUI(pageWithSidebar(
  
  
  # Application title
  headerPanel("Sales Chart"),
  
  # Sidebar with controls to select the relevant driver
  # Options vary with tab selected
  
  sidebarPanel(
    
    selectInput("driver", label=h5("Select a driver to view the sales corresonding to that driver :"),
                                    choices=list(
                                                 "WI National Tv" = 1, 
																							   "WI Spot TV" = 2
                                                ),
																		selected="1",
                                    multiple=FALSE
                )
    
    
  ),
  
  
  mainPanel(
    
    verbatimTextOutput("descriptionText"),
    
    br(),
    
    tableOutput("gvMotion")
    
    #p(a("Glossary", href="https://github.com/HimanshuBabbar/ProgrammingAssignment2/blob/master/Documentation"), align = "center")
    
  )
))
