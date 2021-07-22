library(slickR)
library(svglite)
library(shiny)
library(ChemmineR)
library(DT)

data(sdfsample)
sdfset <- sdfsample


ui <- fluidPage(
    sidebarLayout(
        sidebarPanel(
            sliderInput(inputId = "plot_num", label = "Number of Plots:", min = 1, max = 100, value = 35)
        ),
        mainPanel(
            fluidRow(slickROutput("slick_output", height=500, width='70%')),
            fluidRow(DTOutput('current'))
        )
    )
)

server <- function(input, output) {
    plots <- eventReactive(input$plot_num, {
        lapply(1:input$plot_num, function(i) {
            xmlSVG(plot(sdfset[i:i], print = FALSE), standalone=TRUE)
        })
    })
    
    numcharMat <- eventReactive(input$plot_num, {
        blockmatrix <- datablock2ma(datablocklist = datablock(sdfset[1:input$plot_num]))
        numchar <- splitNumChar(blockmatrix = blockmatrix)
        numchar
    })

    output$slick_output <- renderSlickR({
        charmatrix <- numcharMat()[[1]]
        x <- slickR(plots(), slideId = 'myslick', height=450, width = '70%') %synch%
                (slickR(rownames(charmatrix), slideType = 'p') + settings(arrows = FALSE) )
        x
    })


    shiny::observeEvent(input$slick_output_current,{
        output$current <- renderDT({
            nummatrix <- numcharMat()[[1]]
            center_slide <- ifelse(is.null(input$slick_output_current$.center), 1, input$slick_output_current$.center)
            rnames <- colnames(nummatrix)
            out <- t(nummatrix[center_slide,, drop = FALSE])
            out
        })
    })

   
}

# Run the application 
shinyApp(ui = ui, server = server)
