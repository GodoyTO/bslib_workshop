# Loading servers
source("global.R")
source("1_demSVR.R")


## Calling child servers for item #####
server <- function(input, output, session) {

    ds <- reactive({
        data %>%
            filter(nu_age >= input$age_sli[1],
                   nu_age <= input$age_sli[2])
    })

    demSVR('dem')
    # second_server('number_2')
    # third_server('number_3')
    # fourth_server('number_4')
    # fifth_server('number_5')

}
