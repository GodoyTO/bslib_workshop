demSVR <- function(id) {moduleServer(id,function(input, output, session) {

    output$all_sub <- renderText({
        paste(length(unique(ds$cd_pac)))
    })

    output$mal_sub <- renderText({

        df <- ds %>% filter(tp_sex == 'M')

        paste(length(unique(df$cd_pac)))
    })

    output$fem_sub <- renderText({

        df <- ds %>% filter(tp_sex == 'F')

        paste(length(unique(df$cd_pac)))
    })
})}
