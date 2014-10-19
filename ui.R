
library(shiny)
library(rCharts)

shinyUI(
        pageWithSidebar(
                headerPanel("Student Enrollment Estimation in Colleges"),
                sidebarPanel(
                        radioButtons("gender", label = h5("Please Select Gender:"),
                                     c("Males" = "Males",
                                       "Females" = "Females"), 
                                     selected = 0,
                                     inline = FALSE),
                        
                        selectInput("age", label = h5("Please Select the Age group:"), 
                                    choices = list(" " = " ",                                         "15-17 yrs" = "15-17",
                                                   "15-17 yrs" = "15-17",
                                                   "18-24 yrs" = "18-24",
                                                   "25-34 yrs" = "25-34",
                                                   "35+ yrs" = "35+"), selected = 0),
                        
                        radioButtons("school", label = h5("\nPlease Select the School Type:"),
                                     c("Public" = "Public",
                                       "Private" = "Private"), 
                                     selected = 0),
                       
                        radioButtons("enroll", label = h5("\nPlease Select Enrollment Type:"),
                                     c("Enrolled" = "Enrolled",
                                       "Not Enrolled" = "Not enrolled"), 
                                     selected = 0),
                        
                        actionButton("goButton", "Go!"),
                        br(),
                        p(strong(em("Documentation:",a("Student Enrollment Estimation in Colleges",href="index.html")))),
                        p(strong(em("Github repository:",a("Developing Data Products - Peer Assessment Project; Shiny App",href="https://github.com/sm74101/Developing-Data-Product"))))
                        
                ),
                mainPanel(
                        tabsetPanel(
                                tabPanel("Estimation",
                                        h3('Erollment Estimation Outputs'),
                                        h6('Selected Gener: '),
                                        textOutput("gender"),
                                        h6('Selected Age Group'),
                                        textOutput("age"),
                                        h6('Selected School Type'),
                                        textOutput("school"),
                                        h6('Selected Enrollment Type'),
                                        textOutput("enroll"),
                                        h3("Result"),
                                        h2(verbatimTextOutput("estimation"))
                                         ),
                                tabPanel('Data Summary', 
                                         h3('College Enrollment Data'),
                                         dataTableOutput("dt")
                                        ),
                                tabPanel("Males Enrollment Plot",
                                         showOutput("Plot1", "highcharts")
                                         #plotOutput("Plot1", "polycharts", height="300px", width = "500px")
                                        ),
                                tabPanel("Females Enrollment Plot",
                                         showOutput("Plot2", "highcharts")
                                         #plotOutput("Plot1", "polycharts", height="300px", width = "500px")
                                )
                        ),
                        p(strong("Education is Basic Human Right and also Essential for a Better Society"))
                )
        ))