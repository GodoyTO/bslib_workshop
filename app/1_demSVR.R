demSVR <- function(id) {moduleServer(id,function(input, output, session) {

    ds <- reactive({
        req(input$age_sli)
        eth <- is.null(input$eth_sel)
        data %>%
            filter(nu_age >= input$age_sli[1],
                   nu_age <= input$age_sli[2]) %>%
            filter(eth | nm_ethn %in% input$eth_sel)
    })

    # Update Ethinicty selector
    observe({
        updateSelectizeInput(
            inputId = "eth_sel",
            choices = sort(unique(data$nm_ethn))
        )
    })

    # Upper cards layer ####
    ## Total subjects ####
    output$all_sub <- renderText({
        n_distinct(ds()$cd_pac)
    })

    ## Male subjects ####
    output$mal_sub <- renderText({

        df <- ds() %>% filter(tp_sex == 'M')
        n_distinct(df$cd_pac)
    })

    ## Female subjects ####
    output$fem_sub <- renderText({

        df <- ds() %>% filter(tp_sex == 'F')
        n_distinct(df$cd_pac)
    })

    # Plots layer #####
    ## Population pyramid #####
    output$pyr_pop <- renderPlotly({

        df <- ds() %>%
            select(cd_pac, age_group, tp_sex) %>%
            reframe(n = n(), .by = c(age_group, tp_sex)) %>%
            complete(age_group, tp_sex, fill = list(n = 0)) %>%
            mutate(n = case_when(tp_sex == 'F' ~-n, T~n))

        validate(
            need(!is.null(df), 'No data'),
            need(nrow(df) > 0, 'No data')
        )

        df  %>%  plot_pyramid(
            X = 'n', Y = 'age_group', Z = 'tp_sex', pal = pal[c(4,12)],
            lab_x = 'Whole subjects', text = 'subjects',
            title = paste0(
                '<b>Subjects population pyramid'))
    })

    ## Ethnicity plot layer #####
    output$eth_pop <- renderPlotly({

        df <- ds() %>%
            select(cd_pac, nm_race) %>%
            group_by(nm_race)  %>%
            summarize(num = n()) %>%
            arrange(desc(num)) %>%
            mutate(nm_race_label = factor(nm_race,
                                          levels = sort(unique(nm_race))))


        validate(
            need(!is.null(df), 'No data'),
            need(nrow(df) > 0, 'No data')
        )

        df  %>%  plot_donut(
            n = 'num', label = 'nm_race_label',
            cor = pal[c(4,8,12,16,20)],
            text_n = ' subjects',
            title = paste0(
                '<b>Race distribution'))
    })
})}
