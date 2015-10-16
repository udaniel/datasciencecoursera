
shinyServer(function(input, output) {
    
    dataset <- reactive({
        diamonds[sample(nrow(diamonds), input$sampleSize), ]
    })
    
    output$plot <- renderPlot({
        
        p <- ggplot(dataset(), aes_string(x = input$x, y = input$y)) + geom_point(size = 3) + theme_classic()
        
        if (input$color != 'None')
            p <- p + aes_string(color=input$color)
        
        if (input$jitter)
            p <- p + geom_jitter()
        if (input$smooth)
            p <- p + geom_smooth()
        
        return(p)
        
    })
    
    output$plot3D <- renderScatterplotThree({
        if (input$z == 'None') {
            return ()
        }
        
        p <- scatterplot3js(x = dataset()[[input$x]], y = dataset()[[input$y]], z = dataset()[[input$z]],
                            height = 900, width = 1300, num.ticks = c(7, 7, 7),
                            size = 0.5, renderer = "canvas")
        return(p)
    }) # End of ROC curves
})