#
# This is a Shiny web application. You can run the application by clicking
# the 'Run App' button above.
#
# Find out more about building applications with Shiny here:
#
#    http://shiny.rstudio.com/
#

library(shiny)

# Define UI for application that draws a histogram
library(shiny)

ui <- fluidPage(
    tags$head(tags$script(src = "message-handler.js")),
    actionButton("dobeep", "Play sound")
)

server <- function(input, output, session) {
    observeEvent(input$dobeep, {
        insertUI(selector = "#dobeep",
            where = "afterEnd",
            # beep.wav should be in /www of the shiny app
            ui = tags$audio(src = "microwave_ping_mono.wav", type = "audio/wav", autoplay = T, controls = NA, style="display:none;")
        )
    })
}

shinyApp(ui, server)
