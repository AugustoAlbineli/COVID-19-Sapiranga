library(readxl)
df <- read_excel("COVID SAP.xlsx")

plot.line <- function(df, var.x, var.y, xlab, ylab, lname) {
  out <- ggplot(df, aes_string(x = var.x, y = var.y)) +
    geom_line() +
    labs(x = xlab, y = ylab) +
    scale_color_discrete(name = lname)
  return(out)
}

plot.bar <- function(df, var.x, var.y, xlab, ylab, lname) {
  out <- ggplot(df, aes_string(x = var.x, y = var.y)) +
    geom_col(color="#42c2f5") +
    labs(x = xlab, y = ylab) +
    scale_color_discrete(name = lname)
  return(out)
}

