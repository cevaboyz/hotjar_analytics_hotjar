#install and load package arules
#install.packages("arules")
library(arules)
#install and load arulesViz
#install.packages("arulesViz")
library(arulesViz)
#install and load tidyverse
#install.packages("tidyverse")
library(tidyverse)
#install and load readxml
#install.packages("readxml")
library(readxl)
#install and load knitr
#install.packages("knitr")
library(knitr)
#load ggplot2 as it comes in tidyverse
library(ggplot2)
#install and load lubridate
#install.packages("lubridate")
library(lubridate)
#install and load plyr
#install.packages("plyr")
library(plyr)
library(dplyr)



#import file excel analytics
                         #add your file here 
analytics <- read_excel("Matching_per-confronto_analytics/Analytics 01 - bellissima.com - Italia All Traffic 20210622-20210630.xlsx", 
                        +     sheet = "Dataset1")

#import file excel hotjar

                      #add your file here 
hotjar <- read_excel("#hotjar_extracted_file.xlsx") 



##########################################################

analytics <- analytics %>% transmute(`Hotjar User Id` = `Hotjar User Id`)

hotjar <- hotjar %>% transmute(`Hotjar User ID` = `Hotjar User ID`)

names(hotjar) <- "id"

names(analytics) <- "id"

match <- merge(x=analytics, y= hotjar, by = "id" )

write.csv(match, file = "ID_watchable.csv")

match
