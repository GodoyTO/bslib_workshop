
ui <- page_navbar(
    title = "Trying {bslib}",
    theme = custom_theme,
    nav_panel(
        title = "Test 1",

        layout_column_wrap(
            width = 1/3,
            value_box(
                title = "Total de Pacientes",
                value = 1250,
                showcase = bs_icon("people-fill"),
                theme = "primary"
            ),
            value_box(
                title = "Tempo Médio de Espera",
                value = "24 min",
                showcase = bs_icon("clock-history"),
                theme = "info"
            ),
            value_box(
                title = "Taxa de Retorno",
                value = "12%",
                showcase = bs_icon("arrow-repeat"),
                theme = "success"
            )
        )
    ),
    nav_panel(
        title = "Test 2",
        card(
            card_header("Distribuição por Etnia/Raça"),
            card_body(
                "Aqui estará o gráfico em desenvolvimento."
            ),
            full_screen = TRUE
        )
    ),
    nav_panel(
        "Test 3"
    )
)

source('server.R')

shinyApp(ui, server)
