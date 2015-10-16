library(shiny)
library(ggplot2)
library(threejs)

dataset <- diamonds

shinyUI(pageWithSidebar(
    
    headerPanel("Diamonds Dataset"),
    
    sidebarPanel(
        
        sliderInput('sampleSize', 'Sample Size', min=1, max=nrow(dataset),
                    value = 100, step = 250, round = 0),
        
        selectInput('x', 'X', names(dataset)),
        selectInput('y', 'Y', names(dataset)),
        selectInput('z', 'Z', c('None', names(dataset))),
        selectInput('color', 'Color', c('None', names(dataset))),
        
        checkboxInput('jitter', 'Jitter'),
        checkboxInput('smooth', 'Smooth')
        
    ),
    
    mainPanel(
        tabsetPanel(type = "tabs",
                    tabPanel('plot2D', plotOutput("plot", width = "auto", height = 500)),
                    tabPanel('plot3D', scatterplotThreeOutput("plot3D", width = "100%", height = 900))
        )
    )
))