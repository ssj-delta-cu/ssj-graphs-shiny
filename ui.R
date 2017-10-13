crops <- c('Alfalfa'=1, 
  'Safflower'=12, 
  'Sunflower'=22, 
  'Corn'=23, 
  'Rice'=24, 
  'Bush Berries'=108, 
  'Vineyards'=109, 
  'Potatoes'=246, 
  'Cucurbit'=277, 
  'Tomatoes'=278, 
  'Truck Crops'=279, 
  'Cherries'=403, 
  'Olives'=409, 
  'Pears'=412, 
  'Citrus'=425, 
  'Almonds'=500, 
  'Pistachios'=502, 
  'Walnuts'=503, 
  'Pasture'=800, 
  'Fallow'=916, 
  'Semi-agricultural/ROW'=913, 
  'Other Deciduous'=914, 
  'Turf'=908, 
  'Floating Vegetation'=2002, 
  'Forage Grass'=2003, 
  'Riparian'=2004, 
  'Upland Herbaceous'=2005, 
  'Urban'=2006, 
  'Water'=2007, 
  'Wet herbaceous/sub irrigated pasture'=2008, 
  'Unknown'=0, 
  'Asparagus'=201, 
  'Carrots'=211, 
  'Young Orchard'=752, 
  'Sudan Grass'=14, 
  'Nursery'=756, 
  'Eucalyptus'=284
)

# Define UI for random distribution app ----
ui <- fluidPage(
  
  img(src='cws_logo_48.png', align="right"),
  
  # App title ----
  titlePanel("Crop Evapotranspiration in the Sacramento-San Joaquin Delta"),
  
  # Sidebar layout with input and output definitions ----
  sidebarLayout(
    
    # Sidebar panel for inputs ----
    sidebarPanel(
      
      # input model selector
      checkboxGroupInput("model_select", "Models to show:",
                         c("CalSIMETAW"="calsimetaw", "DETAW"="detaw", "DisALEXI"="disalexi", "ITRC"="itrc",
                           "SIMS"="sims", "UCD-METRIC"="ucdmetric", "UCD-PT"="ucdpt"),
                          selected=c("calsimetaw", "detaw", "disalexi", "itrc", "sims", "ucdmetric", "ucdpt")),
    
      
      # br() element to introduce extra vertical spacing ----
      br(),
      
      # input crop selector
      selectInput("crop_select_1", "Landuse Type", crops[sort(names(crops))], selected=1)
    ),
    
    # Main panel for displaying outputs ----
    mainPanel(
      
      # Output: Tabset w/ plot, summary, and table ----
      tabsetPanel(type = "tabs",
                  tabPanel("Fig 14: monthly ET", plotOutput("lineplot1", width="100%", height="600px"), img(src='legend_horizontal_eto.png', align="center")),
                  tabPanel("Fig 15: cumulative ET", plotOutput("cumulativeplot1", width="100%", height="600px"), img(src='legend_horizontal_eto.png', align="center")),
                  tabPanel("Fig 16: ETRF", plotOutput("etrf1", width="100%", height="600px"), img(src='legend_horizontal_eto.png', align="center"))
      )
      
    )
  )
)