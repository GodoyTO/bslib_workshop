if(!require(shiny)) install.packages('shiny'); require(shiny)
if(!require(bslib)) install.packages('bslib'); require(bslib)
if(!require(bsicons)) install.packages('bsicons'); require(bsicons)
if(!require(tidyverse)) install.packages('tidyverse'); require(tidyverse)
if(!require(plotly)) install.packages('plotly'); require(plotly)

custom_theme <- bs_theme(
    version = 5,
    bootswatch = "lux",
    primary = "#007bff"
)

data <- readRDS('data/dash_ds.rds')

pal <- c(
    '#ffcbcb', '#ffabab', '#ff8a8a', '#b87070', # Red
    '#e5ffc9', '#edffab', '#bdff8a', '#8ab870', # Green
    '#cae5ff', '#acedff', '#89bbff', '#6f8ab7', # Blue
    '#ffffc9', '#ffffab', '#ffe08a', '#d8b370', # Yellow
    '#ffc9e5', '#ffabed', '#ff8abd', '#b8708a', # Pink
    '#e5c9ff', '#cbabff', '#bd8aff', '#8a70b8', # Purple
    '#ffe5c9', '#ffd0ab', '#ffb38a', '#c88170', # Orange
    '#c9ffff', '#abf1ff', '#8ae0ff', '#70a3b8', # Cyan
    '#ffc9f2', '#ffabeb', '#ff8ae2', '#b870a3', # Magenta
    '#d4d1ff', '#bcbafe', '#817aef', '#918aef'  # Lilac
)
