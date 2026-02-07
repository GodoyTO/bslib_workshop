
dem_ui <- function(id) {nav_panel(
    title = "Demografia",

    layout_column_wrap(
        width = 1/3, heights_equal = "row", fill = F,
        value_box(
            title = "Total subjects",
            value = textOutput(NS(id, 'all_sub')),
            showcase = span(bs_icon("people-fill"),
                            style = "color: #7b3df1"),
            theme = value_box_theme(bg = "#9c6bf4")
        ),
        value_box(
            title = "Male subjects",
            value = textOutput(NS(id, 'mal_sub')),
            showcase = span(bs_icon("people-fill"),
                            style = "color: #5f7aa7"),
            theme = value_box_theme(bg = "#6f8ab7")
        ),
        value_box(
            title = "Female subjects",
            value = textOutput(NS(id, 'fem_sub')),
            showcase = span(bs_icon("people-fill"),
                            style = "color: #a8607a"),
            theme = value_box_theme(bg = "#b8708a")
        )
    )
)}
