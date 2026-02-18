diaSVR <- function(id) {moduleServer(id,function(input, output, session) {

    ds <- reactive({
        req(input$age_sli)
        req(input$dia_sli)
        data %>%
            filter(dt_diag >= input$dia_sli[1],
                   dt_diag <= input$dia_sli[2]) %>%
            filter(nu_age_diag >= input$age_sli[1],
                   nu_age_diag <= input$age_sli[2])
    })

    # Plots layer #####
    ## Disease stage plot #####
    output$stg_bar <- renderPlotly({

        df <- ds() %>%
            select(stage) %>%
            reframe(n = n(), .by = stage) %>%
            arrange(stage)

        n <- nrow(ds())

        validate(
            need(!is.null(df), 'No data'),
            need(nrow(df) > 0, 'No data')
        )

        df  %>%  plot_hbar(
            x = 'n', y = 'stage', color = pal[c(12,8,16,4,24)],
            total = n, var_text = "Subjects"
            )
    })

})}
