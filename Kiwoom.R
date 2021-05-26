install.packages("foreign")  # install foreign packages(to read csv file)
install.packages("dplyr")    
install.package("ggplot2")  

library(foreign)             # reading csv file
library(dplyr)               # 
library(ggplot2)             # 
library(readxl)              # 

### Hitter

record_kiwoom_h <-read.csv(file ="D:\\pstudy\\R\\baseball\\2020_Kiwoom_Hitter.csv",header=T)

Kiwoom_Hitter_record <- record_kiwoom_h

Kiwoom_Hitter_record <- rename(Kiwoom_Hitter_record,
                           name = '선수명')
View(Kiwoom_Hitter_record)

# selecting OPS, AVG, RSIP
Data_Analysis_Hitter <- Kiwoom_Hitter_record %>% 
  select(name, OPS, AVG, RISP) 



### Pitcher

record_kiwoom_p <-read.csv(file ="D:\\pstudy\\R\\baseball\\2020_Kiwoom_Pitcher.csv",header=T)

Kiwoom_Pitcher_record <- record_kiwoom_p

Kiwoom_Pitcher_record <- rename(Kiwoom_Pitcher_record,
                            name = '선수명')
View(Kiwoom_Pitcher_record)

Kiwoom_Pitcher_record$FIP <-  round((13 * Kiwoom_Pitcher_record$HR + 3 * (Kiwoom_Pitcher_record$BB + Kiwoom_Pitcher_record$HBP - Kiwoom_Pitcher_record$IBB) - 2 * Kiwoom_Pitcher_record$SO)/Kiwoom_Pitcher_record$IP + 3.2, 2)

Kiwoom_Pitcher_record$BB_9 <- round(Kiwoom_Pitcher_record$BB / 9, 2)

Kiwoom_Pitcher_record$SO_9 <- round(Kiwoom_Pitcher_record$SO / 9, 2)
View(Kiwoom_Pitcher_record)


# selecting FIP, BB/9, SO/9, WHIP
Data_Analysis_Pitcher <- Kiwoom_Pitcher_record %>% 
  select(name, FIP, BB_9, SO_9,  WHIP) 

View(Data_Analysis_Pitcher)

# Write on csv file
write.csv(Data_Analysis_Hitter, "Data_Analysis_Hitter_Kiwoom.csv")
write.csv(Data_Analysis_Pitcher, "Data_Analysis_Pitcher_Kiwoom.csv")

