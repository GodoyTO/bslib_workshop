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

## Simple Donut plot ####
plot_donut <- function(
        df, n, label, cor = pal,
        text_n = ' subjects', title = NULL) {

    df$prop <- round(df[[n]]/sum(df[[n]])*100, 1)
    df[[label]] <- str_wrap(df[[label]], width = 16)

    plot_ly() %>%
        add_pie(data = df, labels = ~df[[label]],
                values = ~df[[n]],
                hole = 0.5,
                sort = FALSE,
                direction = 'clockwise',
                rotation = 0,
                marker = list(colors = cor,
                              line = list(color = '#FFFFFF', width = 1)),
                domain = list(row = 0, column = 0),
                textinfo = 'label',
                textposition = 'inside',
                # customizar o texto
                hoverinfo = 'text',
                text = ~paste0("<b>", df[[label]], "</b><br>",
                               format(df[[n]], big.mark = '.',
                                      decimal.mark = ','), text_n, '<br>',
                               format(df$prop, big.mark = '.',
                                      decimal.mark = ','), '%')) %>%

        layout(
            title = list(text = title, y = 0.97, x = 0.5, font = list(size = 16)),
            margin = list(pad = 1, t = 50, b = 10, l = 10, r = 10),
            legend = list(orientation = 'v',
                          yanchor = "center",
                          y= 0.5),
            hoverlabel = list(font = list(size = 16))
        )
}

plot_pyramid <- function(
        df, X, Y, Z, pal, lab_y = ' ', lab_x, text = 'Cases', title = NULL) {

    maxim <- max(abs(df[[X]]))
    denom <- as.numeric(paste0(1, glue::glue_collapse(rep(0, nchar(maxim)-1))))
    max_n <- round(maxim/denom)*denom

    value_x  <- c(-max_n, -max_n/2, 0, max_n/2, max_n)
    text_x   <- format(abs(value_x), big.mark = '.', decimal.mark = ',')
    interval <- c(-(maxim + maxim*0.05), maxim + maxim*0.05)

    plot_ly(df) %>%
        add_trace(
            x = df[[X]], y = df[[Y]],
            color = df[[Z]],
            type = 'bar',
            colors = pal,
            orientation = 'h',
            hoverinfo = 'text',
            textposition = 'none',
            text = paste0('<b>',df[[Y]],'</b><br>',
                          df[[Z]], '<br>',
                          format(abs(df[[X]]), big.mark = '.',
                                 decimal.mark = ','), ' ', text))  %>%
        layout(
            bargap = 0.1,
            barmode = 'overlay',
            title = list(text = title, y = 0.97, x = 0.5, font = list(size = 16)),
            margin = list(pad = 1,
                          t = 50),
            legend = list(orientation = 'v',
                          yanchor = "center",
                          y = 0.5,
                          font = list(size = 16)),

            yaxis = list(title = list(text = lab_y,
                                      font = list(size = 15)),
                         zeroline = FALSE, mirror = TRUE,
                         showline = TRUE, linewidth = 1,
                         linecolor = 'black',
                         showgrid = TRUE
            ),

            xaxis = list(title = list(text = lab_x,
                                      font = list(size = 15)),
                         tickvals = value_x,
                         ticktext = text_x,
                         range = interval,
                         zeroline = TRUE, mirror = TRUE,
                         showline = TRUE, linewidth = 1,
                         linecolor = 'black',
                         showgrid = TRUE
            ),
            hoverlabel = list(font = list(size = 16))
        )
}
