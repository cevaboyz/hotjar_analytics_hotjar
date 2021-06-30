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
                         #rename your file analytics
analytics <- read_excel("analytics.xlsx", 
                        +     sheet = "Dataset1")

#import file excel hotjar

                      #rename your file hotjar 
hotjar <- read_excel("hotjar.xlsx") 



##########################################################

analytics <- analytics %>% transmute(`Hotjar User Id` = `Hotjar User Id`)

hotjar <- hotjar %>% transmute(`Hotjar User ID` = `Hotjar User ID`)

names(hotjar) <- "id"

names(analytics) <- "id"

match <- merge(x=analytics, y= hotjar, by = "id" )

write.csv(match, file = "ID_watchable.csv")

match
