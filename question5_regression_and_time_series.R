# Question 5: Regression and Time Series

# Install relevant packages.
install.packages(datarium)
remotes::install_github("kassambara/detarium")
install.packages("ggplot2")
install.packages("olsrr")
install.packages("plotly")
install.package("xts")
install.packages("zoo")

# Load relevant packages into memory.
library(plotly)
library(datarium)
library(ggplot2)
library(xts)
library(zoo)

# Load relevant datasets into memory.
data("longley")

# Check if the dataset has been loaded
# into memory correctly.
longley

# Store the dataset in a variable
# called economicdata.

# Extract the head of the dataset.
head(longley, 5)


# Extract the tail of the dataset.
tail(longley, 5)

# Generate a linear regression about economic regression
# using the longley dataset.
economicData <- longley
# Distance is the response variable (Y).
# Speed is the explanatory variable (X)
plot(longley$Unemployed,longley$Population)
plot(longley$Year,longley$Population)
plot(longley$Employed,longley$Unemployed)

# Test the relationship between X and Y
# for all variables.
cor.test(longley$Employed,longley$Year)
cor.test(longley$Employed,longley$Unemployed)
cor.test(longley$Employed,longley$Population)
cor.test(longley$Unemployed,longley$Year)
cor.test(longley$Unemployed,longley$Armed.Forces)
cor.test(longley$Employed,longley$Armed.Forces)
cor.test(longley$GNP.deflator,longley$GNP)

# Develop and display a linear model.
linearMod <- lm(Employed~Unemployed,data=longley)
linearMod

# Summarise the longley dataset.
summary(LinearMod)
linearMod
class(linearMod)
hist(LinearMod)
anova(LinearMod)
aov(dist~speed,data=datacar)

# Model checking
# Check for any assumptions
plot(LinearMod)
hist(LinearMod$residuals)

#Perform tests to check for normality.
shapiro.test(LinearMod$residuals)
# Shapiro Wilk test rejects the null hypothesis
# that residual are normally distributed.

# Multiple linear regression model.
model1<- lm(Employed ~ ., data = longley)
summary(model1)
anova(model1)

# Perform tests on variable for NAs.
all(is.na(GNP.deflator))
all(is.na(GNP))
all(is.na(Unemployed))
all(is.na(Armed.Forces))
all(is.na(Population))
all(is.na(Year))
all(is.na(Employed))

# Develop a reduced model.
model <- lm(Employed~Year, data = longley)
model
summary(model)
anova(model)

# Compare models
anova(model,model1)
# Model 1 is better because it does not have a
# significant p-value (<0.05). If the p-value was
# significant (>0.05) model 2 would be better.

plot(model1)
hist(model1$residuals)
shapiro.test(model1$reiduals)

# Model checking using using.
ols_test_normality(model)

sessionInfo()
citation("plotly")
citation("ggplot2")

# Question 5 (v): Time Series
# Produce a time series plot of Employed against
# years and produce the autocorrelation plat of values
# using the ts() function.

economicTimeSeries <- ts(data = longley, start=c(1947), end=c(1962))
plot(economicTimeSeries,)# xaxt = "Year")
axis(side = 2, at = NULL, labels = TRUE)
axis(side=1, at = NULL, labels = TRUE)


# Create a time series using ggplot.
economicTimeSeries<-as.data.frame(economicTimeSeries)
p <- ggplot(data = economicTimeSeries, aes(x=date, y=Y)) +
  geom_line(alpha=1,  color="#69b3a2", size=2) +
  geom_point(alpha=1, color="red", size=2) +
  xlab("Time")+ylab("Quarterly Earnings")+
  scale_x_date(date_labels = "%Y %b %d")+
  theme(axis.text.x=element_text(angle=60, hjust=1))

