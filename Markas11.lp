---
title: "Markas11"
author: "Mark Christian"
date: "11/22/2020"
output: html_document
---

```{r setup, include=FALSE}
knitr::opts_chunk$set(echo = TRUE)
```
```{r}
library(lpSolveAPI)

lprec <- make.lp(0, 7)
set.objfn(lprec, c(775,800,800,800,800,775,750))
add.constraint(lprec, c(0, 1, 1, 1, 1 ,1, 0), ">=", 18)
add.constraint(lprec, c(0, 0, 1, 1, 1 ,1, 1), ">=", 27)
add.constraint(lprec, c(1, 0, 0, 1, 1 ,1, 1), ">=", 22)
add.constraint(lprec, c(1, 1, 0, 0, 1 ,1, 1), ">=", 26)
add.constraint(lprec, c(1, 1, 1, 0, 0 ,1, 1), ">=", 25)
add.constraint(lprec, c(1, 1, 1, 1, 0 ,0, 1), ">=", 21)
add.constraint(lprec, c(1, 1, 1, 1, 1 ,0, 0), ">=", 19)
set.bounds(lprec, lower = c(0, 0, 0, 0, 0, 0, 0), columns = c(1, 2,3,4,5,6,7))
set.type(lprec,1:7,"integer")
lp.rownames <- c("Sunday", "Monday", "Tuesday", "Wednesady", "Thursday", "Friday", "Saturday")
lp.colnames <- c("Shift1", "Shift2", "Shift3", "Shift4", "Shift5", "Shift6", "Shift7")
dimnames(lprec) <- list(lp.rownames, lp.colnames)
lprec
write.lp(lprec, filename = "Markas11.lp", type = "lp")
```