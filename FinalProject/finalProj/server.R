#
# This is the server logic of a Shiny web application. You can run the
# application by clicking 'Run App' above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)
library(ggplot2)

# Define server logic required to draw a histogram
shinyServer(function(input, output) {
    
    pathRed <- paste(getwd(), "winequality-red.csv", sep = "/")
    pathWhite <- paste(getwd(), "winequality-white.csv", sep = "/")
    
    dfRed <- read.csv(pathRed,sep=';')
    dfWhite <- read.csv(pathWhite,sep=';')
    
    dfRed$type <- sapply(dfRed$density,function(x){'red'})
    dfWhite$type <- sapply(dfWhite$density,function(x){'white'})
    
    wine <- rbind(dfRed,dfWhite)
    
    dist_options <- c("Residual Sugar" = "residual.sugar",
                      "Citric Acid" = "citric.acid",
                      "Fixed Acidety"="fixed.acidity",
                      "Volatile Acidity"="volatile.acidity",
                      "Chlorides"="chlorides",
                      "Free Sulfur Dioxide"="free.sulfur.dioxide",
                      "Total Sulfur Dioxide"="total.sulfur.dioxide",
                      "Density"="density",
                      "pH"="pH",
                      "Sulphates"="sulphates",
                      "Alcohol"="alcohol",
                      "Quality"="quality")
    
    output$winePlotByType <- renderPlot({
        ggplot(wine,aes(.data[[input$features]])) + geom_histogram(aes(fill=type), color='black',bins=input$bins) + labs(x = names(which(dist_options == input$features)))
        
    })
    
    output$winePlotByCitricAcidAndResidualSugar <- renderPlot({
        ggplot(wine,aes(x=citric.acid,y=residual.sugar)) + geom_point(aes(color=type),alpha=0.4)
        
    })
    
    output$winePlotByVolatileAcidityAndResidualSugar <- renderPlot({
        ggplot(wine,aes(x=volatile.acidity,y=residual.sugar)) + geom_point(aes(color=type),alpha=0.4)
        
    })
    
    output$redWinePlotByType <- renderPlot({
        ggplot(dfRed,aes(.data[[input$featuresRed]])) + geom_histogram(aes(fill=type), color='black',bins=input$binsRed) + labs(x = names(which(dist_options == input$featuresRed)))
        
    })
    
    output$redWinePlotByCitricAcidAndResidualSugar <- renderPlot({
        ggplot(dfRed,aes(x=citric.acid,y=residual.sugar)) + geom_point(aes(color=type),alpha=0.4)
        
    })
    
    output$redWinePlotByVolatileAcidityAndResidualSugar <- renderPlot({
        ggplot(dfRed,aes(x=volatile.acidity,y=residual.sugar)) + geom_point(aes(color=type),alpha=0.4)
        
    })
    
    output$whiteWinePlotByType <- renderPlot({
        ggplot(dfWhite,aes(.data[[input$featureswhite]])) + geom_histogram(aes(fill=type), color='black',bins=input$binsWhite) + labs(x = names(which(dist_options == input$featureswhite)))
        
    })
    
    output$whiteWinePlotByCitricAcidAndResidualSugar <- renderPlot({
        ggplot(dfWhite,aes(x=citric.acid,y=residual.sugar)) + geom_point(aes(color=type),alpha=0.4)
        
    })
    
    output$whiteWinePlotByVolatileAcidityAndResidualSugar <- renderPlot({
        ggplot(dfWhite,aes(x=volatile.acidity,y=residual.sugar)) + geom_point(aes(color=type),alpha=0.4)
        
    })
})