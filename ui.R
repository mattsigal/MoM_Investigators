library(shiny)
dat <- read.csv("./data/Investigators.csv")
dat$Set <- factor(dat$Set, 
                  levels = c("MAD01", "MAD06", "MAD09", "MAD20"))

shinyUI(fluidPage(
  title = "Mansions of Madness: Second Edition Investigators",
  h1("Mansions of Madness: Second Edition Investigators"),
  includeHTML("lead.html"),
  hr(),
  fluidRow(
    column(5,
           checkboxGroupInput('show_sets', 
                              'Investigator Sets to Show:', 
                              c("MAD01: 1st Ed. coreset/Recurring Nightmares" = "MAD01",
                                "MAD06: Forbidden Alchemy/Surpressed Memories" = "MAD06",
                                "MAD09: Call of the Wild/Surpressed Memories" = "MAD09", 
                                "MAD20: 2nd Ed. coreset" = "MAD20"),
                              selected = levels(dat$Set),
                              width = '100%')
    ),
    column(6,
           h5("Random Investigators?"),
           HTML("Given the selected sets, randomly sample an investigation team. <p>"),
           selectInput('players', 'Number of Characters to Sample:', 
                       c("All" = 0, "One" = 1, "Two" = 2, "Three" = 3, "Four" = 4, "Five" = 5),
                       selected = 0)
    )
  ),
  hr(),
  dataTableOutput('investigators')
))