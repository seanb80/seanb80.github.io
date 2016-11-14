# Written by Sean Bennett
# Last Updated 11-14-2016

# Loads the maps package for the second part of the visualization
require(maps)

## Loads the CO2 data set
dataset = read.csv("co2.csv")

## Converts the Year/Month tag into a string, from a factor to facilitate pruning
dataset$Month <- as.character(dataset$Month)

## Pulls off the month data from the Year/Month string, leaving just the year
for(i in 1:length(dataset$Month))   {
  
  dataset$Month[i] <- substr(dataset$Month[i], 1, 4)
  
}

## Makes a new column to replace the month data pruned above
dataset[3] <- rep(1:12, 16)

## Some column naming stuff
colnames(dataset)[3] <- "month"
colnames(dataset)[1] <- "year"

## Loads the shiny library.
library(shiny)

# Define UI for application that plots CO2 data and makes a map
ui <- shinyUI(fluidPage(
   
   # Application title
   titlePanel("CO2 Concentration measured at Mauna Loa by month 1965-1980"),
   
   # Sidebar slider inputs for specifying month and map boundaries 
   sidebarLayout(
      sidebarPanel(
         sliderInput("month",
                     "Month of Interest (0 = full year mean)",
                     min = 0,
                     max =12,
                     value = 0),
         sliderInput("latMin", "Latitude Minimum", min = -90, max = 90, value = -90),
         sliderInput("latMax", "Latitude Maximum", min = -90, max = 90, value = 90),
         sliderInput("longMin", "Longitude Minimum", min = -180, max = 180, value = -180),
         sliderInput("longMax", "Longitude Maximum", min = -180, max = 180, value = 180),
         sliderInput("xVal", "X Coordinate for point", min = -180, max = 180, value = 0),
         sliderInput("yVal", "Y Coordinate for point", min = -90, max = 90, value = 0),
         sliderInput("pointType", "Point type", min = 1, max = 25, value = 1),
         sliderInput("pointSize", "Point Size", min = 1, max = 20, value = 1)
        
         ),
      
      # Shows the plot and map
      mainPanel(
         plotOutput("distPlot"),
         plotOutput("mapPlot")
      )
   )
))

# Define server logic required 
server <- shinyServer(function(input, output) {
  
  
  ## outputs the plot, checking if the user wants to see the mean for the year, or individual month data
  output$distPlot <- renderPlot({
      
     if(input$month == 0)   {
       plot(levels(as.factor(dataset$year)), tapply(X = dataset$co2, INDEX = as.factor(dataset$year), FUN = mean), type = "b", xlab = "Year", ylab = "Mean CO2 concentration", main = "Mean CO2 concentration measured at Mauna Loa by year")
     }else { 
      plot(levels(as.factor(dataset$year)), dataset$co2[dataset$month == input$month], type = "b", xlab = "Year", ylab = "Mean CO2 Concentration", main = "Mean CO2 concentration measured at Mauna Loa by month")
     }
    })

  ## Outputs the map, as well as places a user defined point
  output$mapPlot <- renderPlot({
    
    map(database = "world", xlim = c(input$longMin, input$longMax), ylim = c(input$latMin, input$latMax))
    points(input$xVal, input$yVal, pch = input$pointType, cex = input$pointSize)
  })   
})

# Run the application 
shinyApp(ui = ui, server = server)

