---
title: "Untitled"
author: "Mark Christian"
date: "10/19/2020"
output: pdf_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```
```{r}
lprec <- make.lp(0, 6)
set.objfn(lprec, c(622,614,630,641,645,649))
add.constraint(lprec, c(1, 1, 1, 0 ,0 ,0), "<=", 100)
add.constraint(lprec, c(0, 0, 0, 1 ,1 ,1), "<=", 120)
add.constraint(lprec, c(1, 0, 0, 1, 0 ,0 ), "=", 80)
add.constraint(lprec, c(0, 1, 0, 0, 1 ,0 ), "=", 60)
add.constraint(lprec, c(0, 0, 1, 0, 0 ,1 ), "=", 70)
set.bounds(lprec, lower = c(0, 0, 0, 0, 0, 0), columns = c(1, 2,3,4,5,6)) 
lprec
write.lp(lprec, filename = "mchris26.lp", type = "lp")
```