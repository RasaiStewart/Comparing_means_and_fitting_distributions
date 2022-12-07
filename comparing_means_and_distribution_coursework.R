# Install relevant packages.
install.packages("ggpubr")
install.packages("tidyverse")
install.packages("dplyr")
install.packages("fitdistrplus")
install.package("ggplot2")

# Load relevant libraries.
library(dplyr)
library(fitdistrplus)
library(ggplot2)
library(ggpubr)

# Load relevant datasets.
data("groundbeef", package = "fitdistrplus")


# Assign the groundbeef dataset to a package.
serving <- groundbeef$serving

# Generate data.
serving

summary(serving)
# Clean the data.
# Rename variables.
serving <- read.table(header = TRUE, text=' ')

#groundbeef <- groundbeef %>%
#  rename(groundbeef.my_data = servings_in_grams,
#         groundbeef.serving = servings)

# Check if the dataset is normally distributed.
class(groundbeef)  
# Create a scatter graph with a line of best fit.
  ggplot(data = groundbeef) +
  geom_point(mapping = aes(x = serving, y = my_data))
  