#####Day 3 Task 2: Bivariate Analysis
# Load libraries
library(ggplot2)

# Load cleaned dataset
clean <- read.csv("data/nhis_clean.csv", stringsAsFactors = FALSE)

#### 1. Quantitative vs Qualitative


## 1A: AGE by SEX_A - Base R
boxplot(AGEP_A ~ SEX_A, data=clean,
        main="Age by Sex",
        xlab="Sex (1=Male, 2=Female)",
        ylab="Age",
        col=c("lightblue","lightgreen"))

# 1B: AGE by SEX_A ggplot2
ggplot(clean, aes(x=factor(SEX_A), y=AGEP_A, fill=factor(SEX_A))) +
  geom_boxplot() +
  labs(title="Age by Sex", x="Sex (1=Male, 2=Female)", y="Age") +
  scale_fill_manual(values=c("lightblue","lightgreen")) +
  theme_minimal()

# 1C Age by EDUCP_A Base R
boxplot(AGEP_A ~ EDUCP_A, data=clean,
        main="Age by Education",
        xlab="Education Level",
        ylab="Age",
        col="lightgreen",
        las=2)  

# 1D Age by EDUCP_A ggplot2
ggplot(clean, aes(x=factor(EDUCP_A), y=AGEP_A, fill=factor(EDUCP_A))) +
  geom_boxplot() +
  labs(title="Age by Education", x="Education Level", y="Age") +
  theme_minimal() +
  theme(axis.text.x = element_text(angle=45, hjust=1))




# 2. Qualitative vs Qualitative

# Clustered bar chart ggplot2
ggplot(clean, aes(x=factor(PHSTAT_A), fill=factor(LSATIS4R_A))) +
  geom_bar(position="dodge") +
  labs(title="Life Satisfaction by General Health",
       x="General Health Status",
       y="Count",
       fill="Life Satisfaction") +
  theme_minimal()




# 3. Quantitative vs Quantitative

# 3A: Height vs weight Base R version 
plot(clean$HEIGHTTC_A, clean$WEIGHTLBTC_A,
     main="Height vs Weight",
     xlab="Height (inches)",
     ylab="Weight (lbs)",
     col="orchid", pch=16)

# 3B Height vs weight ggplot2
ggplot(clean, aes(x=HEIGHTTC_A, y=WEIGHTLBTC_A)) +
  geom_point(color="blue") +
  labs(title="Height vs Weight", x="Height (inches)", y="Weight (lbs)") +
  theme_minimal()

# 3C Correlation coefficient
cor_value <- cor(clean$HEIGHTTC_A, clean$WEIGHTLBTC_A, use="complete.obs")
cat("Correlation coefficient (Height vs Weight):", cor_value, "\n")



