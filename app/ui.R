source("global.R")
source("1_dem_UI.R")
source("2_dia_UI.R")

ui <- page_navbar(
    tags$head(
        tags$style(HTML("
   /* Align the flex display of the logo, text and navbar*/
   .navbar-brand {
      display: flex !important;
      align-items: center !important;
      padding-top: 0 !important;
      padding-bottom: 0 !important;
      height: 30px;
    }

    .navbar-nav, .navbar-brand {
      align-self: center;
    }"
        ))
    ),
    title = div(
        img(src = "dash.png", height = "30px", style = "margin-right: 20px;"),
        span("Trying {bslib}")
    ),
    theme = custom_theme,


    dem_ui('dem'),
    dia_ui('dia'),
    nav_panel(
        "Something",
        "Lorem ipsum dolor sit amet, consectetur adipiscing elit.
        Morbi condimentum ultrices orci, et ullamcorper enim consequat ut.
        Nullam laoreet tempus tellus ac laoreet. Orci varius natoque penatibus
        et magnis dis parturient montes, nascetur ridiculus mus.
        Fusce a eros dui. Nunc id tellus metus. Aenean mollis consequat tortor,
        non tempor nisl pulvinar ac. Vestibulum quis ullamcorper risus.
        Nulla rutrum lorem sed erat rutrum sagittis. Maecenas id facilisis enim."
    )
)
