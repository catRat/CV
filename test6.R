# version: 6 -- 'black cat'
# author: Mingdong Zhou
# encoding: utf-8
# the goal is to finish the task that
# update the price per carrier per line to catapalt system
# it need two input
# both there path name must be fixed, one is carrier.csv
# orther is rate.csv
# the carrier.csv format must be one data element one line
# the rate.csv must be do not have variable name
# the object rate is a main dataframe
library(readr)
library(writexl)
source('ifunc.R')
# import data
name <- scan("carrier.csv", what = "charatar")
rate <- read_csv("rate.csv", col_names = FALSE)
name <- name[which(!duplicated(name))]
name <- toupper(name)
# use function
codeName <- GetCode(name)
updateContractId <- GetId(codeName) 
# name variable for rate
rate <- 
  Name(rate, col_nummer = c(7, 8, 10),
    names = c("Carrier", "Effective.Date", "X20GP"))
# task 1, select the relation where
# the carrier need to update the price for them line
handOfSelect <- FALSE
for(i in seq(name)) {
  handOfSelect <-
    as.character(rate$Carrier) == codeName[i] |
      handOfSelect
}
rate <- rate[which(handOfSelect), ] 
rm(handOfSelect)
rm(i)
# task 2, Date value task, thr rule is:
# if the Effective.Date is small than today,
# make it equal today
# When import rate.csv, the Effective.Date is a factor in rate,
# turn it to Date by turn it to character
# After the task is done, turn it to character
rate$Effective.Date <- as.character(rate$Effective.Date) 
rate$Effective.Date <- as.Date(rate$Effective.Date, "%m/%d/%Y") 
rate$Effective.Date[rate$Effective.Date < Sys.Date()] <-
  Sys.Date() 
rate$Effective.Date <- 
  as.character(rate$Effective.Date, "%m/%d/%Y") 
# avoid the risk of appear litter point
len <- 10:13
rate[, len] <- round(rate[, len])
rm(len)
# task3, add a variable name contractId to dataframe,
# the rule is that add contractId 
# to realation codeName
contractId <- c()
for(i in seq(dim(rate)[1])) {
  for(r in seq(codeName)) {
    if(as.character(rate$Carrier[i]) == codeName[r]) {
       contractId[i] <- updateContractId[r]
    }
  }
}
rm(i, r)
rate$contractId <- contractId
# task 4, add a variable who name is
# updateIdentification to dataframe,
# SPRC mean south .. of china
rate$idetification <-
  rep(paste("SPRC", format(Sys.Date(), "%y%m%d"), sep = ""),
    dim(rate)[1])
# order variable of rate and lastest titing
rate <- rate[c(18, 1:4, 7:9, 15:17, 10:13)]
rate <- rate[!duplicated(rate), ]
rate <- rate[which(!is.na(rate$X20GP)), ]
# a object who for serching in capatale system serch interface
keyWord <- paste(codeName, updateContractId, sep = "_")
# output 
write.csv(keyWord, "keyword.csv", row.names = FALSE)
write.csv(rate, "update.csv", row.names = FALSE)
# message to stdout
cat("Done! Outing in file keyword.csv and update.csv\n",
  date())
rm(list=ls())
