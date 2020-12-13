#
# This is the user-interface definition of a Shiny web application. You can
# run the application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(shinydashboard)

props <- c("fixed.acidity", "volatile.acidity", "citric.acid", "residual.sugar", "chlorides", "free.sulfur.dioxide", "total.sulfur.dioxide", "density", "pH", "sulphates", "alcohol", "quality")

# Define UI for application that draws a histogram
shinyUI(fluidPage(
    dashboardPage(
        dashboardHeader(title = "Wines !!!"),
        dashboardSidebar(
            sidebarMenu(
                menuItem("Wines", tabName = "wines", icon = icon("wine-bottle", class = "fas fa-wine-bottle")),
                menuItem("Red WIne", tabName = "red_wines", icon = icon("wine-bottle", class = "fas fa-wine-bottle")),
                menuItem("White Wine", tabName = "white_wines", icon = icon("wine-bottle", class = "fas fa-wine-bottle"))
            )
        ),
        dashboardBody(
            
            tabItems(
                tabItem("wines",
                        box(plotOutput("winePlotByType"), width = 8),
                        
                        box(
                            selectInput("features", "Features:", props),
                            width = 4
                        ),
                        
                        sidebarLayout(
                            sidebarPanel(
                                sliderInput("bins",
                                            "Number of bins:",
                                            min = 1,
                                            max = 50,
                                            value = 30)
                            ),
                            
                            mainPanel(
                            )
                        ),
                        box(plotOutput("winePlotByCitricAcidAndResidualSugar"), width = 8),
                        
                        box(plotOutput("winePlotByVolatileAcidityAndResidualSugar"), width = 8)
                ),
                tabItem("red_wines",
                        box(plotOutput("redWinePlotByType"), width = 8),
                        
                        box(
                            selectInput("featuresRed", "Features:", props),
                            width = 4
                        ),
                        
                        sidebarLayout(
                            sidebarPanel(
                                sliderInput("binsRed",
                                            "Number of bins:",
                                            min = 1,
                                            max = 50,
                                            value = 30)
                            ),
                            
                            mainPanel(
                            )
                        ),
                        
                        box(plotOutput("redWinePlotByCitricAcidAndResidualSugar"), width = 8),
                        
                        box(plotOutput("redWinePlotByVolatileAcidityAndResidualSugar"), width = 8)
                ),
                tabItem("white_wines",
                        box(plotOutput("whiteWinePlotByType"), width = 8),
                        
                        box(
                            selectInput("featureswhite", "Features:", props),
                            width = 4
                        ),
                        
                        sidebarLayout(
                            sidebarPanel(
                                sliderInput("binsWhite",
                                            "Number of bins:",
                                            min = 1,
                                            max = 50,
                                            value = 30)
                            ),
                            
                            mainPanel(
                            )
                        ),
                        
                        box(plotOutput("whiteWinePlotByCitricAcidAndResidualSugar"), width = 8),
                        
                        box(plotOutput("whiteWinePlotByVolatileAcidityAndResidualSugar"), width = 8))
            )
            
        )
    )
))