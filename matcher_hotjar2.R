
library(plyr)
library(dplyr)
library(openxlsx)

##########################################################

#import file excel analytics

analytics <- read_excel("analytics.xlsx", sheet = "Dataset1")

#import file excel hotjar

hotjar <- read_excel("hotjar.xlsx")

##########################################################


names(hotjar)[18]<- "id"

hotjar<- subset(hotjar, select= 18)

analytics <- analytics %>% select(id = "Hotjar User Id")

names(analytics)[1]<-"id"

matches <- merge(x=analytics, y=hotjar, by = "id")

##########################################################

#Final Output

write.xlsx(matches, file = "ID_watchable_1.xlsx")


