# Loading servers
source("1_demSVR.R")
source("2_diaSVR.R")

## Calling child servers for item #####
server <- function(input, output, session) {

    demSVR('dem')
    diaSVR('dia')
    # third_server('number_3')
    # fourth_server('number_4')
    # fifth_server('number_5')

}
