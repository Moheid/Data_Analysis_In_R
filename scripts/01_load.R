# Project name: Data Analysis in R 
# Project data: 2022-08-06
# Author: Mohamed Ibrahim
# version: 01

# LOAD THE DATA 
social <- read.csv('social.csv')
View(social)

# LOAD DATA MANIPULATING PACKAGES 
library(tidyverse)
# DATA CLEANING PROCESS
glimpse(social)
colnames(social)

df <- rename(social, 
         gender = "Q1_Select.gender.type", 
         age = "Q2_How.old.are.you.", 
         education = "Q3_What.is.your.education.background",
         profession = "Q4_what.is.your.current.profession.", 
         workDuration = "Q5_How.long.you.have.been.working.your.company.",
         typeSocial = "Q6_What.kind.of.social.media.do.you.use.",
         useSocial = "Q7_How.often.do.you.use.social.media.", 
         productivity = "Q8_Do.you.finish.your.project.activities.on.time.",
         socialDuration = "Q9_Hom.many.hours.do.you.spend.social.meda.on.daily.base.")
view(df)

dir.create("data_process")

write_csv(df, file = "data_process/clean_social.csv")
