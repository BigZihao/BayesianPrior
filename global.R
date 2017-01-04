library(dplyr)
library(ggplot2)
b1=read.csv("BayesianExample.csv")
b1=b1[1:100,]
prior <- function(a,b){
  
  dom <- seq(0,2,0.01)
  val <- dnorm(dom,a,b)
  return(data.frame('x'=dom, 'y'=val))
}
### Function: Likelihood Plot Values
likelihood <- function(a,b){
  dom <- seq(0,2,0.01)
  val <- dnorm(dom,a,b)
  return(data.frame('x'=dom, 'y'=val))
}
posterior <- function(a1,b1,a2,b2){
  a <- (a1*(b2^2)+a2*(b1^2))/(b1^2+b2^2)
  b <- sqrt(1/(1/b1^2+  1/b2^2))
  dom <- seq(0,2,0.01)
  val <- dnorm(dom,a,b)
  return(data.frame('x'=dom, 'y'=val))
}


X=as.matrix(cbind(1,b1$distribution))
Y=as.matrix(b1$y)
beta=solve(t(X) %*% X) %*% (t(X) %*% Y)
beta
eta=as.matrix(Y-X %*% beta)
s=(t(eta) %*% eta)/(length(Y)-2)
s=as.numeric(s)
sigma=(solve(t(X) %*% X)*s)[2,2]




