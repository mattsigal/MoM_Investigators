dat <- read.csv("./data/Investigators.csv")
dat$Set <- factor(dat$Set, 
                  levels = c("MAD01", "MAD06", "MAD09", "MAD20"))

shinyServer(function(input, output) {

  out <- reactive({
    t_out <- dat[dat$Set %in% input$show_sets, ]
    if (input$players != 0){
      t_out <- t_out[sample(nrow(t_out), size = input$players, replace = FALSE), ]
    }
    return(t_out)})
  
  output$investigators = renderDataTable(out(), 
                                         options = list(paging = FALSE,
                                                        searchHighlight = TRUE))
})
