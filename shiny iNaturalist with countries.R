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
                radioButtons("provider", "Choose map provider", c("Stamen.Toner","Stamen.Watercolor","Stamen.Terrain","Esri","Esri.NatGeoWorldMap")),
                radioButtons("country", "Choose country",c("Czechia","Germany","Poland","Ukraine","Italy","France"))
    )
  ),
  dashboardBody(h2("iNaturalist animal map"),
                leafletOutput("map_output"))
)

server <- function(input,output){
  animal <- reactive({
    get_inat_obs(input$animal_input, bounds = c(if(input$country == "Czechia")
    {c(48.5553052842,12.2401111182, 51.1172677679,18.8531441586)},
    if(input$country == "Germany")
    {c(47.3024876979,5.98865807458, 54.983104153,15.0169958839)},
    if(input$country == "Poland")
    {c(49.0273953314, 14.0745211117, 54.8515359564, 24.0299857927)},
    if(input$country == "Ukraine")
    {c(44.3614785833, 22.0856083513, 52.3350745713, 40.0807890155)},
    if(input$country == "Italy")
    {c( 36.61998729,6.7499552751, 47.1153931748,18.4802470232)},
    if(input$country == "France")
    {c( 2.05338918702,-54.5247541978, 51.1485061713,9.56001631027)})
    ) # https://gist.github.com/graydon/11198540 list of counties borders
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
}

shinyApp(ui,server)
