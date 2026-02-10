# Demographic Data Panel ####
dem_ui <- function(id) {nav_panel(
    title = "Demographic data",

    layout_sidebar(
        sidebar = sidebar(
            title = "Selectors",
            width = 200,
            sliderInput(
                inputId = NS(id, "age_sli"), label = "Select min and max age:",
                min = min(data$nu_age), max = max(data$nu_age),
                value = range(data$nu_age)
            ),
            selectizeInput(
                inputId = NS(id, "eth_sel"),
                label = "Select country of origin:",
                choices = NULL, multiple = TRUE,
                options = list(
                    placeholder = 'Select an option',
                    plugins = list("remove_button", "restore_on_backspace"))
            )
        ),


        # Upper cards layer ####
        layout_column_wrap(
            width = 1/3, heights_equal = "row", fill = F,
            ## Total subjects ####
            value_box(
                title = span("Total subjects",
                             style = "font-size: 1rem; font-weight: bold;"),
                value = span(textOutput(NS(id, 'all_sub')), style = "font-size: 2rem;"),
                showcase = span(bs_icon("people-fill"),
                                style = "color: #7b3df1"),
                theme = value_box_theme(bg = "#9c6bf4")
            ),
            ## Male subjects ####
            value_box(
                title = span("Male subjects",
                             style = "font-size: 1rem; font-weight: bold;"),
                value = textOutput(NS(id, 'mal_sub')),
                showcase = span(bs_icon("people-fill"),
                                style = "color: #5f7aa7"),
                theme = value_box_theme(bg = "#6f8ab7")
            ),
            ## Female subjects ####
            value_box(
                title = span("Female subjects",
                             style = "font-size: 1rem; font-weight: bold;"),
                value = textOutput(NS(id, 'fem_sub')),
                showcase = span(bs_icon("people-fill"),
                                style = "color: #a8607a"),
                theme = value_box_theme(bg = "#b8708a")
            )
        ),

        # Plots layer #####
        layout_column_wrap(
            width = 1/2, heights_equal = "row", fill = F,
            ## Population pyramid #####
            card(
                # card_title("Population pyramid", class = "m-0 p-0"),
                card_body(plotlyOutput(NS(id,'pyr_pop')), class = "m-0 p-0"),
                full_screen = T
            ),
            ## Ethnicity plot layer #####
            card(
                # card_title("Ethnicity plot", class = "m-0 p-0"),
                card_body(plotlyOutput(NS(id,'eth_pop')), class = "m-0 p-0"),
                card_footer("Categories made for this specific fake dataset"),
                full_screen = T
            )
        )
    )
)}
