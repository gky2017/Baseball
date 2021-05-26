install.packages("foreign")  # install foreign packages(to read csv file)
install.packages("dplyr")    
install.package("ggplot2")  

library(foreign)             # reading csv file
library(dplyr)               # 
library(ggplot2)             # 
library(readxl)              # 

### Hitter

record_hanwha_h <-read.csv(file ="D:\\pstudy\\R\\baseball\\2020_Hanwha_Hitter.csv",header=T)

Hanwha_Hitter_record <- record_hanwha_h

Hanwha_Hitter_record <- rename(Hanwha_Hitter_record,
                               name = '선수명')
View(Hanwha_Hitter_record)

# selecting OPS, AVG, RSIP
Data_Analysis_Hitter <- Hanwha_Hitter_record %>% 
  select(name, OPS, AVG, RISP) 



### Pitcher

record_hanwha_p <-read.csv(file ="D:\\pstudy\\R\\baseball\\2020_Hanwha_Pitcher.csv",header=T)

Hanwha_Pitcher_record <- record_hanwha_p

Hanwha_Pitcher_record <- rename(Hanwha_Pitcher_record,
                                name = '선수명')
View(Hanwha_Pitcher_record)

Hanwha_Pitcher_record$FIP <-  round((13 * Hanwha_Pitcher_record$HR + 3 * (Hanwha_Pitcher_record$BB + Hanwha_Pitcher_record$HBP - Hanwha_Pitcher_record$IBB) - 2 * Hanwha_Pitcher_record$SO)/Hanwha_Pitcher_record$IP + 3.2, 2)

Hanwha_Pitcher_record$BB_9 <- round(Hanwha_Pitcher_record$BB / 9, 2)

Hanwha_Pitcher_record$SO_9 <- round(Hanwha_Pitcher_record$SO / 9, 2)
View(Hanwha_Pitcher_record)


# selecting FIP, BB/9, SO/9, WHIP
Data_Analysis_Pitcher <- Hanwha_Pitcher_record %>% 
  select(name, FIP, BB_9, SO_9,  WHIP) 

View(Data_Analysis_Pitcher)

# Write on csv file
write.csv(Data_Analysis_Hitter, "Data_Analysis_Hitter_Hanwha.csv")
write.csv(Data_Analysis_Pitcher, "Data_Analysis_Pitcher_Hanwha.csv")

