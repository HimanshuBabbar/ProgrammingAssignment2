shinyServer(function(input, output) {
  
  
  output$descriptionText <- renderText({
    
    if(input$driver == 1){
      
      paste("This is an example of Google Motion Chart.

              CLTV represents the sales acquired by a marketing driver National TV 
              against regions, markets or Sub-DMA's for a calendar year.
            
              Feel free to play around with the axes and the color variables 
              before playing the motion on the time axis."
      )
      
    } else {
      
      paste("This is an example of Google Geo Chart.

              Here the CLTV repesents the aggregated sales for a particular DMA for a 
              marketing driver Spot TV.

              Hover on a particular DMA of the US metro map to 
              see the sales data for that area."
            )
      
      
    }
    
    
  })
  
  
  # use the new renderGvis
  output$gvMotion <- renderGvis({
 
    # subset by season
    #dat <- subset(tableByGame,Season==input$driver)
    
    if(input$driver == 1){
        
#       initState <- '{
#           "colorOption": Region, "orderedByX" : true
#       }'
      
      gvisMotionChart(nCleanData, idvar="Subdma", timevar="Week", xvar = "CLTV", yvar = "CLTV",
                      options = list(width=800, height = 500))      
      
    } else{
      
      gvisGeoChart(sCleanData, "Subdma", "CLTV",
                   options = list( region="US", displayMode="regions",
                                   resolution="metros",
                                   width=800, height=500, 
                                   backgroundColor="lightblue",
                                   colorAxis="{colors:['#008A2E', '#003D14']}"
                   )
      )
      
    }
   
	
  })
  
})
