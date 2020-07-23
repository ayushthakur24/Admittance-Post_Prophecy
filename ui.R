
library(shiny)
library(shinydashboard)
library(readxl)



  title <- tags$a(tags$img(src="image.jpg", height='40', width='40'),'Admittance & Post Prophecy',target="_blank")

  shinyUI(
  dashboardPage(
    dashboardHeader(title = title, titleWidth = 500),
    dashboardSidebar(
      sidebarMenu(id = 'sidebarmenu',
                  menuItem("Overview", tabName = "Overview", icon = icon("list-alt")),
                  menuItem("Data", icon = icon("database"), tabName = "data"),
                  menuItem("Predict", icon = icon("dashboard"), tabName = "Predict")
                  )),
  
  
  dashboardBody(
    tags$body(
      tags$link(rel = "stylesheet", type = "text/css", href = "custom.css"),
    
  tabItems(
      tabItem("Overview", h1("What is Admittance and Post Prophecy All About"),
      h4("Technology is now evolving at such a rapid pace that annual predictions of trends can seem out-of-date before they even go live as a published blog post or article. 
      As technology evolves, it enables even faster change and progress, causing the acceleration of the rate of change, until eventually it will become exponential.
      Technology-based careers don't change at that same speed, but they do evolve, and the savvy IT professional recognizes that his or her role will not stay the same.
      The IT worker of the 21st century will constantly be learning, out of necessity if not desire.What does this mean for you? It means staying current with technology trends. 
      And it means keeping your eyes on the future, to know which skills you'll need to know and what types of jobs you want to be qualified to do."),
      br(),
      h4("Taking admission in a college , on the grounds of infrastructure and facilities is not inof. The first and the most important attribute before choosing a college is it's 
      placements . Not only the placements must be high , but the individual should also be eligible for sitting in the drive and should have the ability to crack it. Having the 
      previous year records of the placed students enables the present students to improve their profile overall so as to achieve the same.")),

      tabItem(tabName ="data",h4("This is the reference table used for prediction"),
              sidebarLayout(
                sidebarPanel(width="3",
                  fileInput("file1", "Choose XLSX File",
                            multiple = FALSE,
                            accept = c("text/xlsx",
                                       "text/comma-separated-values,text/plain",
                                       ".xlsx")),
                 
                  # Horizontal line ----
                  tags$hr(),
                  
                  # Input: Select number of rows to display ----
                  radioButtons("disp", "Display",
                               choices = c(Head = "head",
                                           All = "all"),
                               selected = "all")
                  
                ),
                # Main panel for displaying outputs ----
                mainPanel(
                  # Output: Data file ----
                  tableOutput("contents")
                  
              ))),
      tabItem(tabName = "Predict",h4("Choose Y-axis"),
              sidebarLayout(
                sidebarPanel(
                  width="3",
                  radioButtons("s", "Select X-axis:",
                               list("Placed"='a1')),
                  radioButtons("k", "Select Y-axis:",
                               list("X %"='a2', "XII %"='b2', "Graduate GPA"='c2',
                                    "Prog.Lang Known"='d2'))
                               
                ),
                mainPanel(
                plotOutput("distPlot")
              )))
      
      
)
)
)
)
)







