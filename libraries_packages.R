#Note:Always check if they are installed and loaded before running any script
#Data wrangling
library(tidyverse)
library(data.table)

#Plot GUI builders
library(esquisse);esquisser()

plotly::ggplotly() #convert a ggplot object into plotly object

ggplotgui::ggplot_shiny() #builder to create basic graphs simultaneously in ggplot and/or plotly

#Packages Data imputation/missing values
library(mice)
library(Amelia)
library(Hmisc)
library(missForest)
library(missMDA)

#Dimension Reduction and Clustering (Unsupervised learning)
library(FactoMineR)
library(Factoshiny)
library(cluster)
library(factoextra)

#Supervised Learning
library(caret)
library(caretEnsemble)
library(h2o)

#Creating apps
library(shiny)
library(shinydashboard)
library(shinyWidgets)


#Miscellaneous
library(radiant);radiant()#Shiny app for Machine Learning
library(rattle);rattle()# GUI app for Data mining with R
library(DataEditR);data_edit()# Shiny app for Data editing (Spreadsheet like)
library(editData);editData()#Shiny app for Data editing (Spreadsheet like)
library(rhandsontable);editAddin()#Shiny app for Data editing (Spreadsheet like)
library(datasets.load);datasets.load()#Shiny app for loading datasets from each installed package








