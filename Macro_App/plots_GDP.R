library(ggplot2)
library(tidyr)
library(dplyr)

##mock plot erstellen 

# erzeugt plot und weist UI zu 
#output$inflation_germany <- renderPlot({
  x <- 1:100
  y <- 1:100
  df <- data.frame(x = x, y = y)
  
  ggplot(data = df, mapping = aes(x = x, y = y)) +
    geom_line() +
    ggtitle("Inflation Rate Germany")
#})
  
  
############Inflation USA, Deutschland, China, Japan DATA

df_inflation <- read.csv("data/annual_infation.csv") 

df_inflation <- df_inflation[-c(5:9), ] #überflüssige rows löschen

df_inflation <- df_inflation %>% 
  pivot_longer(
    cols = starts_with("X"),
    names_to = "Year",
    names_prefix = "X",
    values_to = "Inflation"
  ) %>% 
  select(-Series.Name) %>% 
  rename(
    "Country" = "Country.Name" 
  )

############### PLOT INFLATION 

output$inflation_plot <- renderPlot({
  
  ggplot(data = df_inflation, mapping = aes(x = as.numeric(Year), y = Inflation, colour = Country)) +
    geom_line(size = 1) +
    labs(
      title = "Inflation Rate Over Time",
      subtitle = "Annual Consumer Price Inflation",
      x = "Year",
      y = "Inflation Rate (%)"
    ) +
    theme_classic() +
    theme(
      plot.title = element_text(face = "bold", size = 16),
      plot.subtitle = element_text(size = 12),
      legend.position = "bottom"
    )
})














  
  



  
