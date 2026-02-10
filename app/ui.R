source("global.R")
source("1_dem_UI.R")

ui <- page_navbar(
    title = "Trying {bslib}",
    theme = custom_theme,


    dem_ui('dem'),
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
