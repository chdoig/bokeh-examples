
# Install required packages
install.packages("devtools")
devtools::install_github("ramnathv/htmlwidgets")
devtools::install_github("bokeh/rbokeh")

# Import libraries
library(htmlwidgets)
library(rbokeh)


## FIGURE 1: RANDOM DISTRIBUTION
# Generate random distribution 
x1 <- rgamma(1000, 3)
y1 <- -0.5*x1+rnorm(1000)+rnorm(1000)

# Show figure 1 (random distribution)
f <- figure(width = 1200, height = 1200, xgrid = FALSE, ygrid = FALSE) %>% ly_hexbin(x1, y1, alpha = 0.75, inv=log, palette=colorRampPalette(c("white", "blue")))
f

# Write html to file `bokeh_random`
sink('bokeh_random.html')
cat(get_bokeh_html(f))
# Stop writing to the file
sink()


## FIGURE 2: BASEBALL
d <- tempfile()
download.file("https://gist.githubusercontent.com/hafen/77f25b556725b3d0066b/raw/10f0e811f09f2b9f0f9ccfb542e296dfac2761d4/doubles.csv", method="curl", f)
doubles <- read.csv(d)

f <- figure(xgrid = FALSE, ygrid = FALSE, width = 1200, height = 800,
            xlab = "Horizontal distance from home plate (ft.)",
            ylab = "Vertical distance from home plate (ft.)") %>%
  ## hit hexbin
  ly_hexbin(doubles, xbins = 120, shape = 0.77, alpha = 0.75, palette = colorRampPalette(c("white", "blue")))

f

sink('bokeh_baseball.html')
cat(get_bokeh_html(f))
# Stop writing to the file
sink()


