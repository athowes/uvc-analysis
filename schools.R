data <- readr::read_csv("data/spc_school_level_underlying_data_23112023.csv")

library(ggplot2)
library(dplyr)

ggplot(data, aes(x = `headcount of pupils`)) +
  geom_histogram(bins = 40, col = "grey10", fill = "grey80") +
  theme_minimal() +
  labs(
    title = "Distribution of school sizes in England",
    x = "Pupil headcount",
    y = "",
    caption = "Data from England School Census 2022/23"
  )

x <- data |>
  filter(`headcount of pupils` > 0) |>
  pull(`headcount of pupils`) |>
  as.numeric()

log_normal_fit <- MASS::fitdistr(x, "log-normal")

ggplot(data, aes(x = `headcount of pupils`)) +
  geom_histogram(bins = 40, col = "grey10", fill = "grey80", aes(y = ..density..)) +
  geom_function(fun = dlnorm, args = list(meanlog = log_normal_fit$estimate[["meanlog"]], sdlog = log_normal_fit$estimate[["sdlog"]]), colour = "darkorange3") +
  theme_minimal() +
  labs(
    title = "Distribution of school sizes in England",
    x = "Pupil headcount",
    y = "",
    caption = "Data from England School Census 2022/23"
  )

log_normal_fit$estimate
# meanlog    sdlog 
# 5.488122 1.020391
