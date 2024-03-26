data <- readr::read_csv("data/spc_school_level_underlying_data_23112023.csv")

library(ggplot2)

ggplot(data, aes(x = `headcount of pupils`)) +
  geom_histogram(bins = 40, col = "grey10", fill = "grey60") +
  theme_minimal() +
  labs(x = "Pupil headcount", y = "", caption = "Data from UK School Census 2022/23")
