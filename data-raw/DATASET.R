## code to prepare `DATASET` dataset goes here


data1_fish <- read.csv2(paste("data_raw/data_fish_2019.csv",sep=""),header=T)

data_fish_peche <- read.csv2(paste("data_fish_2019_peche.csv",sep=""),header=T)



usethis::use_data(DATASET, overwrite = TRUE)
