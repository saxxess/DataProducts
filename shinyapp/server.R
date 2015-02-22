shinyServer(function(input, output) {
      # make user specific variables
      
      output$text <- renderText({
            input$title
            })
      
      output$plot <- renderPlot({
            x <- mtcars[ , input$x]
            y <- mtcars[ , input$y]
            plot(x, y, pch = 16)
            fit <- lm(y ~ x)
            abline(fit, lwd = 2, col="red")
            })
      
      output$r_squared <- renderPrint({
            x <- mtcars[ , input$x]
            y <- mtcars[ , input$y]
            fit <- lm(y ~ x)
            summary(fit)$r.squared*100
      })
      
      
      output$coefficients1 <- renderPrint({
            x <- mtcars[ , input$x]
            y <- mtcars[ , input$y]
            fit <- lm(y ~ x)
            fit$coefficients[[1]]
      })
      
      output$coefficients2 <- renderPrint({
            x <- mtcars[ , input$x]
            y <- mtcars[ , input$y]
            fit <- lm(y ~ x)
            fit$coefficients[[2]]
      })
      
      output$residuals <- renderPlot({
            x <- mtcars[ , input$x]
            y <- mtcars[ , input$y]
            fit <- lm(y ~ x)
            e <- resid(fit)
            yhat <- predict(fit)
            plot(
                  x, e, ylab = "Residuals", 
                  col = "black", cex = 1.1, pch = 21,frame = FALSE
                  )
            abline(h = 0, lwd = 2)
            })

      })