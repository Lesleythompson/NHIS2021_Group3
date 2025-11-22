# Load required library for ggplot2
library(ggplot2)

# Check first few rows and column names
head(clean)
names(clean)

######DAY 3
#### Task 1
###Summary Statistics 

#Quantitative Variables

# 1. Age (AGEP_A)
cat("=== AGE (AGEP_A) ===\n")
summary(clean$AGEP_A)                     # Min, 1st Qu., Median, Mean, 3rd Qu., Max
cat("Mean:", mean(clean$AGEP_A, na.rm=TRUE), "\n")
cat("Median:", median(clean$AGEP_A, na.rm=TRUE), "\n")
cat("Standard Deviation:", sd(clean$AGEP_A, na.rm=TRUE), "\n\n")

# 2. Weight (WEIGHTLBTC_A)
cat("=== WEIGHT (WEIGHTLBTC_A) ===\n")
summary(clean$WEIGHTLBTC_A)
cat("Mean:", mean(clean$WEIGHTLBTC_A, na.rm=TRUE), "\n")
cat("Median:", median(clean$WEIGHTLBTC_A, na.rm=TRUE), "\n")
cat("Standard Deviation:", sd(clean$WEIGHTLBTC_A, na.rm=TRUE), "\n\n")

# 3. Height (HEIGHTTC_A)
cat("=== HEIGHT (HEIGHTTC_A) ===\n")
summary(clean$HEIGHTTC_A)
cat("Mean:", mean(clean$HEIGHTTC_A, na.rm=TRUE), "\n")
cat("Median:", median(clean$HEIGHTTC_A, na.rm=TRUE), "\n")
cat("Standard Deviation:", sd(clean$HEIGHTTC_A, na.rm=TRUE), "\n")



### Base R Histograms
hist(clean$AGEP_A, main="Age Histogram", xlab="Age")
hist(clean$WEIGHTLBTC_A, main="Weight Histogram", xlab="Weight (lbs)")
hist(clean$HEIGHTTC_A, main="Height Histogram", xlab="Height (inches)")


### ggplot2 Histograms 
ggplot(clean, aes(x=AGEP_A)) + geom_histogram(binwidth=5, fill="skyblue", color="black") + labs(title="Age Histogram", x="Age")
ggplot(clean, aes(x=WEIGHTLBTC_A)) + geom_histogram(fill="skyblue", color="black") + labs(title="Weight Histogram")
ggplot(clean, aes(x=HEIGHTTC_A)) + geom_histogram(fill="skyblue", color="black") + labs(title="Height Histogram")





#Boxplots Base R 
boxplot(clean$AGEP_A, main="Age Boxplot")
boxplot(clean$WEIGHTLBTC_A, main="Weight Boxplot")
boxplot(clean$HEIGHTTC_A, main="Height Boxplot")


#Boxplot ggplot2
ggplot(clean, aes(y=AGEP_A)) + geom_boxplot(fill="purple") + labs(title="Age Boxplot")
ggplot(clean, aes(y=WEIGHTLBTC_A)) + geom_boxplot(fill="purple") + labs(title="Weight Boxplot")
ggplot(clean, aes(y=HEIGHTTC_A)) + geom_boxplot(fill="purple") + labs(title="Height Boxplot")



#####Qualitative Variables 
##Frequency Table 

table(clean$SEX_A)
table(clean$HISPALLP_A)
table(clean$EDUCP_A)
table(clean$PHSTAT_A)
table(clean$LSATIS4R_A)

## Base R Bar plots for qualitative variables 
barplot(table(clean$SEX_A), main="Sex", xlab="Category")
barplot(table(clean$HISPALLP_A), main="Race/Ethnicity", xlab="Category")
barplot(table(clean$EDUCP_A), main="Education", xlab="Category")
barplot(table(clean$PHSTAT_A), main="Health Status", xlab="Category")
barplot(table(clean$LSATIS4R_A), main="Life Satisfaction", xlab="Category")


##ggplot2 bar plots 
ggplot(clean, aes(x=SEX_A)) + geom_bar(fill="maroon") + labs(title="Sex")
ggplot(clean, aes(x=HISPALLP_A)) + geom_bar(fill="maroon") + labs(title="Race/Ethnicity")
ggplot(clean, aes(x=EDUCP_A)) + geom_bar(fill="maroon") + labs(title="Education")
ggplot(clean, aes(x=PHSTAT_A)) + geom_bar(fill="maroon") + labs(title="Health Status")
ggplot(clean, aes(x=LSATIS4R_A)) + geom_bar(fill="maroon") + labs(title="Life Satisfaction")








