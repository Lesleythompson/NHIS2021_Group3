##### 05_multivariate_analysis.R
#### Multivariate Visualization

# Load packages
library(ggplot2)
library(psych)

# Load data 
clean <- read.csv("data/nhis_clean.csv", stringsAsFactors = FALSE)

##### Task 1: Part 1 Enhancing Scatter Plot (Height vs Weight)
# Colored by SEX_A and faceted by EDUCP_A
ggplot(clean, aes(x = HEIGHTTC_A, y = WEIGHTLBTC_A, color = factor(SEX_A))) +
  geom_point(alpha = 0.7) +
  facet_wrap(~ EDUCP_A) +   
  labs(
    title = "Height vs Weight by Sex and Education Level",
    x = "Height (inches)",
    y = "Weight (lbs)",
    color = "Sex"
  ) +
  theme_minimal()


#### Part 2 Correlation Plot Matrix
# Variables: Age, Weight, Height

vars_for_corr <- clean[, c("AGEP_A", "WEIGHTLBTC_A", "HEIGHTTC_A")]

# Psych package scatter matrix
pairs.panels(
  vars_for_corr,
  method = "pearson",      # method used 
  hist.col = "lightblue",  # color of histograms
  density = TRUE,         
  ellipses = TRUE          
)


