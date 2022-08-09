## LOAD LIBRARY
library(tidyverse)
## Convert categorical data type into factor 
## Load the data
social <- read_csv("data_process/clean_social.csv")
view(social)
glimpse(social)

unique(social$typeSocial)
### slip multi-columns 

split <- social %>% 
  separate(typeSocial, into = c("useFacebok", "useTwitter", "useYoutube",  "uselinkedin", "useTiktok", "useSnapchat", "useInstagram"), sep = ",", extra = "drop", fill = "right")

view(split)

# Convert into factor and created new datarame 
cateSocial <- social %>% select(c(2,4,5,9)) %>% 
  mutate_if(is.character, as.factor)

view(cateSocial)
glimpse(cateSocial)

## Let us make coding this dataset

attach(cateSocial) # if you activate attach funciton yo don't need prefix data name infront of your cariable 

unique(typeSocial)

codedSocial <- cateSocial %>% 
  mutate_at(c("gender","education","profession","productivity"),
            funs(case_when(
              .=="male"~1,
              .=="female"~0,
              
              .=="master"~5,
              .=="Master"~5,
              .=="degree"~4,
              .=="secondary"~3,
              .=="primary"~2,
              .=="none"~1,
              
              .=="manager"~5,
              .=="lectural"~4,
              .=="officer"~3,
              
              # .=="facebook"~8,
              # .=="youtube"~7,
              # .=="twitter"~6,
              # .=="tiktok"~5,
              # .=="snapch"~4,
              # .=="snapchat"~4,
              # .=="linkedine"~3,
              # .=="instagram"~2,
              # .=="pinterest"~1,
              
              .=="yes"~1,
              .=="no"~0,
            )))
view(codedSocial)
summary(codedSocial)
mean(codedSocial$gender)

# Since we have converted into our data numeric let us change into factor 
codedSocial <- data.frame(
  mutate_if(codedSocial, is.numeric, as.factor)
)
glimpse(codedSocial)


## let us combine data into one dataframe
fsocial <- cbind(cateSocial, codedSocial)
view(fsocial)
levels(gender)
