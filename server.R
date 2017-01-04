
# This is the server logic for a Shiny web application.
# You can find out more about building applications with Shiny here:
#
# http://shiny.rstudio.com
#

library(shiny)

shinyServer(function(input, output) {

  output$distPlot <- renderPlot({

    # generate bins based on input$bins from ui.R
    
    
    lk <- likelihood(beta[2],sqrt(sigma))
    pr <- prior(input$bins,input$sd)
    po <- posterior(input$bins,input$sd,beta[2],sqrt(sigma))
    model_plot <- data.frame('Dist'=c(rep('Prior',nrow(pr)),
                                      rep('Likelihood',nrow(lk)),
                                      rep('Posterior',nrow(po))),
                             rbind(pr,lk,po))
    
    
    model_plot %>% ggplot(aes(x,y)) +geom_path(aes(color=Dist))
    
    

  })
  
  
  output$dist <- renderPlot({
    
    # generate bins based on input$bins from ui.R
    a <- (beta[2]*(input$sd^2)+input$bins*(sigma^2))/(sigma^2+input$sd^2)
    b <- sqrt(1/(1/input$sd^2+  1/sigma^2))
    
    b1 %>% ggplot(aes(distribution,y)) + geom_point()+geom_abline(intercept = beta[1], slope = a)+
      geom_ribbon(aes(ymin=beta[1]+a*distribution-1.96*b,ymax=beta[1]+a*distribution+1.96*b),alpha=0.3)
    
    
    
  })

})
