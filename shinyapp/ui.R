shinyUI(fluidPage(
      titlePanel("mtcars Regression Exploration Tool"),
      sidebarLayout(
            sidebarPanel(
                  textInput("title", "Plot title:", value = "Regression Line vs. Residuals"),
                  selectInput("x", "Choose an x var:", choices = names(mtcars), selected = "disp"),
                  selectInput("y", "Choose a y var:", choices = names(mtcars), selected = "mpg")
            ),
            mainPanel(
                  h3(textOutput("text")),
                  h4("R squared"),
                  h5(textOutput("r_squared", "R squared", container = div)),
                  p("The percentage of datapoints which can be explained through the regression line."),
                  h4("Coefficients"),
                  h5(textOutput("coefficients1", "Coefficients1", container = div)),
                  p("Intercept: giving the point where the line hits the y-axis"),
                  h5(textOutput("coefficients2", "Coefficients2", container = div)),
                  p("Factor: giving the inclination of the regression line"),
                  plotOutput("plot"),
                  plotOutput("residuals")
                  )
            )
      ))

