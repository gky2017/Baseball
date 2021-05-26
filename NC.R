install.packages("foreign")  # install foreign packages(to read csv file)
install.packages("dplyr")    
install.package("ggplot2")  

library(foreign)             # reading csv file
library(dplyr)               # 
library(ggplot2)             # 
library(readxl)              # 

### Hitter

record_nc_h <-read.csv(file ="D:\\pstudy\\R\\baseball\\2020_NC_Hitter.csv",header=T)

NC_Hitter_record <- record_nc_h

NC_Hitter_record <- rename(NC_Hitter_record,
                               name = '선수명')
View(NC_Hitter_record)

# selecting OPS, AVG, RSIP
Data_Analysis_Hitter <- NC_Hitter_record %>% 
  select(name, OPS, AVG, RISP) 



### Pitcher

record_nc_p <-read.csv(file ="D:\\pstudy\\R\\baseball\\2020_NC_Pitcher.csv",header=T)

NC_Pitcher_record <- record_nc_p

NC_Pitcher_record <- rename(NC_Pitcher_record,
                               name = '선수명')
View(NC_Pitcher_record)

NC_Pitcher_record$FIP <-  round((13 * NC_Pitcher_record$HR + 3 * (NC_Pitcher_record$BB + NC_Pitcher_record$HBP - NC_Pitcher_record$IBB) - 2 * NC_Pitcher_record$SO)/NC_Pitcher_record$IP + 3.2, 2)

NC_Pitcher_record$BB_9 <- round(NC_Pitcher_record$BB / 9, 2)

NC_Pitcher_record$SO_9 <- round(NC_Pitcher_record$SO / 9, 2)
View(NC_Pitcher_record)


# selecting FIP, BB/9, SO/9, WHIP
Data_Analysis_Pitcher <- NC_Pitcher_record %>% 
  select(name, FIP, BB_9, SO_9,  WHIP) 

View(Data_Analysis_Pitcher)

# Write on csv file
write.csv(Data_Analysis_Hitter, "Data_Analysis_Hitter_NC.csv")
write.csv(Data_Analysis_Pitcher, "Data_Analysis_Pitcher_NC.csv")

