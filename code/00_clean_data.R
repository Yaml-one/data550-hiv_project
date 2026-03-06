
here::i_am("code/00_clean_data.R") ## i_am() finds absolute file path of the project
# root directory that code/00_clean_data.R is in
absolute_path_to_data <- here::here("raw_data/vrc01_data.csv")
# here() can have a relative filepath input and will use the absolute file path
# previously set in the i_am() line
data <- read.csv(absolute_path_to_data, header = TRUE)


library(labelled)
library(gtsummary)

var_label(data) <- list(
  id = "ID",
  ab_resistance = "Antibody resistance",
  shield_glycans = "Shield glycans",
  region = "Region",
  env_length = "Length of Env protein"
)

data$number_glycans <- ifelse(
  data$shield_glycans < 4,
  "< 4",
  ">= 4"
)

saveRDS(
  data, 
  file = here::here("output/data_clean.rds")
)

