# Project: Marker Basket Analysis 
# Date: 11 Nov 2019
# Author: Matias Barra

# Script purpose: perform a market basket analysis to help Blackwell's board 
# of directors to better understand the clientele that Electronidex is currently 
# serving and if Electronidex would be an optimal acquisition

####--------------- Set Enviroment ---------------------------------------------####
load required libraries
if(require("pacman")=="FALSE"){
  install.packages("pacman")
}
pacman::p_load("readr","ggplot2","arules","arulesViz","plotly", "tidyverse", "knitr", "shinythemes", "plyr")


####--------- Import data sets and initial exploration -------------------------#### 

setwd("/Users/matiasbarra/Documents/Data_Analytics_Course/Data_Analytics_2/4_Discover_Associations_Between_Products")
Data <- read.csv("./data/ElectronidexTransactions2017.csv", header = F)# read transactions as df
sum(Data !="") # check total number of products sold

setwd("/Users/matiasbarra/Documents/Data_Analytics_Course/Data_Analytics_2/4_Discover_Associations_Between_Products")
categories <- read.csv("./data/prodCategories.csv", header = F)# read categories as df

# read "transactions.csv" as basket to perform association rules analysis
Data <- read.transactions("./data/ElectronidexTransactions2017.csv", 
                           format = "basket", 
                           sep = ",",
                           rm.duplicates = F)

summary(Data)
# 9835 rows (elements/itemsets/transactions) and
# 125 columns (items) and a density of 0.03506172 

inspect(Data)# You can view the transactions. Is there a way to see a certain # of transactions? NO
length (Data) # Number of transactions.
size (Data) # Number of items per transaction
LIST(Data) # Lists the transactions by conversion (LIST must be capitalized)
itemLabels(Data)# To see the item labels

#Creating a new Data Frame with a list of 125 products
ProductLabels <- as.data.frame(itemLabels(Data))
ProductLabels

categories$V1 <- NULL
colnames(categories)[1] <- "Product"
colnames(categories)[2] <- "Category"

write.csv(ProductLabels, file="ProductLabels.csv", row.names = F)

str(prodCat) # categories need to be included as labels to the items in tr 


####--------- data transformation ----------------------------------------------------#### 

view(categories)
view(Data)

Data@itemInfo$category <- categories[,2]
Data_divided <- aggregate(Data, by = 'category')
itemLabels(Data_divided)

#plotting the top 10 products more bought
itemFrequencyPlot(Data, topN = 20, type = "absolute")
itemFrequencyPlot(Data, topN = 20, type = "relative")

item.freq.Ab <- itemFrequency(Data, type = 'absolute') 
item.freq.Ab

item.freq.Re <- itemFrequency(Data, type = 'relative') 
item.freq.Re

  
####--------------------- Apriori Algorithm ------------------------------------------####  
rules <- apriori(data = Data,
                 parameter = list(support = 0.002, confidence =0.8))

redundant <- is.redundant(rules, measure = "confidence")
rules <- rules[!redundant]
summary(rules)


rules1 <- apriori(data = Data,
                  parameter = list(support = 0.01, confidence =0.5))

redundant1 <- is.redundant(rules1, measure = "confidence")
rules1 <- rules1[!redundant1]
summary(rules1)


iMacRule <- apriori(data = Data,
                    parameter = list(support = 0.001, confidence = 0.15),
                    appearance = list(default = "rhs", lhs = "iMac"))

hpLaptop.rule <- subset(iMacRule, items %in% 'HP Laptop')
inspect(hpLaptop.rule)

rule_category <- apriori(data = Data_divided,
                         parameter = list(support = 0.002, confidence =0.8))

redundant_category <- is.redundant(rule_category, measure = "confidence")
rule_category <- rule_category[!redundant_category]
summary(rule_category)


####--------------------- Visualizing the results ------------------------------------------####


inspect(sort(rules, by = 'lift')[1:10])
inspect(sort(rules1, by = 'lift')[1:10])
inspect(sort(iMacRule, by = 'lift')[1:10])
inspect(sort(rule_category, by = 'lift')[1:10])


plot(iMacRule[1:10], engine = "interactive")
plot(iMacRule[1:10], method = "graph", )

plotly_arules(iMacRule[1:10], method = "matrix")
plotly_arules(rules)
plotly_arules(rules, measure = c("support", "lift"), shading = "confidence")
plotly_arules(rules, method = "two-key plot")


ruleExplorer(rules)
ruleExplorer(rules1)
ruleExplorer(iMacRule)

# add jitter, change color and markers and add a title
plotly_arules(rules, jitter = 10, 
              marker = list(opacity = .7, size = 10, symbol = 1), 
              colors = c("blue", "green")) 

plot(rules [1:5], method = "graph", measure = "support", 
     shading = "lift", engine = "igraph", data = NULL, control = NULL)
