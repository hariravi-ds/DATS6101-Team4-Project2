df <- read.csv('/Users/hariprasannaa/Downloads/vehicles.csv')
#head(df, 5)

#summary(df)
dim(df)

#colSums(is.na(df))

library(dplyr)
unwantedlist <- c(
  "barrelsA08",
  "cityA08",
  "cityA08U",
  "co2A",
  "co2TailpipeAGpm",
  "combA08",
  "combA08U",
  "fuelCostA08",
  "fuelType2",
  "highwayA08",
  "highwayA08U",
  "rangeA",
  "rangeCityA",
  "rangeHwyA",
  "UCityA",
  "UHighwayA",
  "charge120",
  "charge240",
  "sCharger",
  "tCharger",
  "c240Dscr",
  "charge240b",
  "c240bDscr",
  "phevHwy",
  "phevCity",
  "phevComb",
  "modifiedOn",
  "cityCD",
  "combinedCD",
  "highwayCD",
  "phevBlended",
  "cityE",
  "combE",
  "combinedUF",
  "evMotor",
  "highwayE",
  "highwayUF",
  "cityUF",
  "rangeCity",
  "rangeHwy",
  "range",
  "hlv",
  "hpv",
  "pv2",
  "pv4",
  "lv2",
  "lv4",
  "comb08U",
  "city08U",
  "highway08U"
)

cleaned_df <- df %>% select(-all_of(unwantedlist))
cleaned_df <- na.omit(cleaned_df)

dim(cleaned_df)
colSums(is.na(cleaned_df))

# Count the number of 0's in each column
zero_count_per_column <- cleaned_df %>%
  summarise(across(everything(), ~sum(. == 0, na.rm = TRUE)))

# Print the result
zero_count_per_column
