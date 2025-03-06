## code to prepare `fish` dataset goes here

# Read CSV dataset
# Header : Longueur;Poids;K
data_fish <- read.csv2(paste("data-raw/data_fish_2019.csv", sep = ";"), header = T)

Weigths <- 10 * as.numeric(as.character((data_fish$Poids)))

fish_data <- data.frame(length = 10 * data_fish$Longueur, weight = 10 * data_fish$Poids)


# data_fish_peche <- read.csv2(paste("data-raw/data_fish_2019_peche.csv",sep=""),header=T)



usethis::use_data(fish_data, overwrite = TRUE)
