if(!require(shiny)) install.packages('shiny'); require(shiny)
if(!require(bslib)) install.packages('bslib'); require(bslib)
if(!require(bsicons)) install.packages('bsicons'); require(bsicons)
if(!require(tidyverse)) install.packages('tidyverse'); require(tidyverse)

custom_theme <- bs_theme(
    version = 5,
    bootswatch = "lux",
    primary = "#007bff"
)

ds <- readRDS('data/dash_ds.rds')
