library(shiny)
library(ggplot2)
library(dplyr)
library(shinydashboard)
library(rinat)
library(leaflet)

ui <- dashboardPage(
  skin = "green",
  dashboardHeader(title=""),
  dashboardSidebar(
    sidebarMenu(textInput("animal_input", "Write animal name"),
                radioButtons("provider", "Choose map provider",c("Stamen.Toner","Stamen.Watercolor","Stamen.Terrain","Esri","Esri.NatGeoWorldMap")),
                sliderInput("lat_left", "Choose latitude left bound", -90, 90, 36.34, step = 0.01),
                sliderInput("lat_right", "Choose latitude right bound", -90, 90, 38.6, step = 0.01),
                sliderInput("lon_lower", "Choose longtitude lower bound", -180, 180, 12.08, step = 0.01),
                sliderInput("lon_upper", "Choose longtitude upper bound", -180, 180, 17.2, step = 0.01)
    )
  ),
  dashboardBody(h2("iNaturalist animal map"),
                leafletOutput("map_output"))
)

server <- function(input,output){
  animal <- reactive({
    get_inat_obs(input$animal_input, bounds = c(input$lat_left,input$lon_lower,input$lat_right,input$lon_upper))
  })
  
  output$map_output <- renderLeaflet({
    animal() %>% 
      leaflet() %>% 
      addProviderTiles(provider = input$provider, group = "Esri World Imagery", options = providerTileOptions(noWrap = TRUE)) %>%
      addMarkers(
        animal()$longitude,
        animal()$latitude,
        label = animal()$scientific_name)
  })
  output$map_output2 <- renderLeaflet({
    animal() %>% 
      leaflet() %>% 
      addProviderTiles(provider = input$provider, group = "Esri World Imagery", options = providerTileOptions(noWrap = TRUE)) %>%
      addMarkers(
        animal()$longitude,
        animal()$latitude,
        label = animal()$scientific_name)
  })
}

shinyApp(ui,server)
