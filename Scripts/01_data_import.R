library(readr)#loading package
library(tidyverse)#loading package
setwd("Data")#set working directory within files on my computer
NHIS_2021 <- read.csv("NHIS _Data_2021.csv", header = TRUE) #load hints dataset
View(NHIS_2021)#look at whole data set
dim(NHIS_2021)#gives dimensions for the data
head(NHIS_2021)#print first 6 rows of data
summary(NHIS_2021)# gives summary of data
attach(NHIS_2021)
subNHIS <- NHIS_2021 %>% 
  select(AGEP_A, WEIGHTLBTC_A, HEIGHTTC_A, SEX_A, HISPALLP_A, EDUCP_A, PHSTAT_A, LSATIS4R_A)
#allows us to select only the variables required for analysis, helps prevent the removal of more participants than necessary
View(subNHIS)#making sure only the selected variables show up

