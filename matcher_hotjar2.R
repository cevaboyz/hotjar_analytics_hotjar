
library(plyr)
library(dplyr)
library(openxlsx)


#import file excel analytics

analytics <- read_excel("analytics.xlsx", sheet = "Dataset1")

#import file excel hotjar


hotjar <- read_excel("hotjar.xlsx")



##########################################################



names(hotjar)[18]<- "id"

hotjar<- subset(hotjar, select= 18)

analytics <- analytics %>% select(id = "Hotjar User Id")

names(analytics)[2]<-"id"

#analytics <- subset(analytics, select= 2)

matches <- merge(x=analytics, y=hotjar, by = "id")


#analytics <- analytics %>% transmute("Hotjar User Id" = "Hotjar User Id")

#hotjar <- hotjar %>% transmute("Hotjar User ID" = "Hotjar User ID")

#names(hotjar) <- "id"

#names(analytics) <- "id"

#match <- merge(x=analytics, y= hotjar, by = "id" )

write.xlsx(matches, file = "ID_watchable_1.xlsx")


