setwd("Data")#set working directory within files on my computer
NHIS_2021 <- read.csv("NHIS _Data_2021.csv", header = TRUE) #load hints dataset
attach(NHIS_2021)
subNHIS <- NHIS_2021 %>% 
  select(AGEP_A, WEIGHTLBTC_A, HEIGHTTC_A, SEX_A, HISPALLP_A, EDUCP_A, PHSTAT_A, LSATIS4R_A)
#allows us to select only the variables required for analysis, helps prevent the removal of more participants than necessary
View(subNHIS)#making sure only the selected variables show up
sum(is.na(subNHIS))
#missing values in the code book are 97-99,7, 9, and 996-999 depending on the variable, excluded below by only including values outside of missing
NHIS_omit <- subNHIS[c(AGEP_A <97 & WEIGHTLBTC_A <996 & HEIGHTTC_A <96 & SEX_A <3 & HISPALLP_A <8 & EDUCP_A <11 & PHSTAT_A <6 & LSATIS4R_A <5),]
#Checking to make sure missing values have been ommitted
summary(NHIS_omit)
#seeing how much data was removed from the dataset
str(NHIS_omit)
#creating new levels from 1-4 based on the codebook by excluding all values not in that section
NHIS_omit$EDUCP_A[NHIS_omit$EDUCP_A >=0 & NHIS_omit$EDUCP_A <=3] = 1
NHIS_omit$EDUCP_A[NHIS_omit$EDUCP_A == 4] = 2
NHIS_omit$EDUCP_A[NHIS_omit$EDUCP_A >=5 & NHIS_omit$EDUCP_A <=7] = 3
NHIS_omit$EDUCP_A[NHIS_omit$EDUCP_A >=8 & NHIS_omit$EDUCP_A <=10] = 4
#making sure the new levels are working
summary(NHIS_omit$EDUCP_A)
#adding the labels to the new levels for education using the NHIS 2021 codebook
NHIS_2021_clean <- NHIS_omit %>%
  mutate(EDUCP_A = factor(EDUCP_A,
                          levels = c(1,2,3,4),
                          labels = c("less than High School","High School Graduate", "Some College Education","College Graduate or better")))
#Making sure data labels are showing up properly
summary(NHIS_2021_clean$EDUCP_A)
#making sure that education is now a factor variable with meaningful labels
str(NHIS_2021_clean$EDUCP_A)
View(NHIS_2021_clean)
#creating the cleaned .csv file for submission, with the help function
?write.csv
write.csv(NHIS_2021_clean, "nhis_clean.csv")
