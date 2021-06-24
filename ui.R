library(shiny)
library(shinydashboard)
library(ggplot2)
library(plotly)
source("data.R")

ui <- dashboardPage(
    
    dashboardHeader(title = "COVID-19 Sapiranga"),
    
    dashboardSidebar(
        sidebarMenu(
            menuItem("Positivos", tabName = "positivos", icon = icon("chart-bar")),
            menuItem("Ativos", tabName = "ativos", icon = icon("chart-bar")),
            menuItem("Hospitalizados", tabName = "hospital", icon = icon("chart-bar")),
            menuItem("Óbitos", tabName = "obitos", icon = icon("chart-bar")),
            menuItem("Curados", tabName = "curados", icon = icon("chart-bar"))
            
        ) #sidebarMenu
    ), #dashboardSidebar
    
    dashboardBody(
        tabItems(
            tabItem(tabName = "positivos",
                    fluidRow(
                        valueBoxOutput(width = 3, outputId = "caixadia"),
                        valueBoxOutput(width = 2, outputId = "caixapositivos"),
                        valueBoxOutput(width = 2, outputId = "caixanpositivos"),
                        valueBoxOutput(width = 4, outputId = "caixamaxpositivos")
                        
                    ),#fluidRow1
                    
                    fluidRow(
                        box(
                            plotlyOutput(outputId = "positivos")),
                        box(
                            plotlyOutput(outputId = "npositivos"))
                        
                    )#fluidRow2
            ), #tabItem_positivos
            
            tabItem(tabName = "ativos",
                    fluidRow(
                        valueBoxOutput(width = 3, outputId = "caixa2dia"),
                        valueBoxOutput(width = 2, outputId = "caixanativos"),
                        valueBoxOutput(width = 4, outputId = "caixamaxativos")
                        
                    ),#fluidRow1
                    
                    fluidRow(
                        box(
                            plotlyOutput(outputId = "ativos"), width=400)
                        
                    )#fluidRow2
            ), #tabItem_ativos
            
            tabItem(tabName = "hospital",
                    fluidRow(
                        valueBoxOutput(width = 3, outputId = "caixa3dia"),
                        valueBoxOutput(width = 2, outputId = "caixahospital"),
                        valueBoxOutput(width = 2, outputId = "caixanhospital"),
                        valueBoxOutput(width = 2, outputId = "caixamaxhospital")
                        
                    ),#fluidRow1
                    
                    fluidRow(
                        box(
                            plotlyOutput(outputId = "hospital")),
                        box(
                            plotlyOutput(outputId = "nhospital"))
                    )#fluidRow2
            ), #tabItem_hospital
            
            tabItem(tabName = "obitos",
                    fluidRow(
                        valueBoxOutput(width = 3, outputId = "caixa4dia"),
                        valueBoxOutput(width = 2, outputId = "caixaobitos"),
                        valueBoxOutput(width = 2, outputId = "caixanobitos"),
                        valueBoxOutput(width = 2, outputId = "caixamaxobitos")
                        
                    ),#fluidRow1
                    
                    fluidRow(
                        box(
                            plotlyOutput(outputId = "obitos")),
                        box(
                            plotlyOutput(outputId = "nobitos"))
                    )#fluidRow2
            ), #tabItem_obitos
            
            tabItem(tabName = "curados",
                    fluidRow(
                        valueBoxOutput(width = 3, outputId = "caixa5dia"),
                        valueBoxOutput(width = 2, outputId = "caixacurados"),
                        valueBoxOutput(width = 2, outputId = "caixancurados"),
                        valueBoxOutput(width = 2, outputId = "caixamaxcurados")
                        
                    ),#fluidRow1
                    
                    fluidRow(
                        box(
                            plotlyOutput(outputId = "curados")),
                        box(
                            plotlyOutput(outputId = "ncurados"))
                    )#fluidRow
            ) #tabItem_curados
            
            
        )#tabItems
    )#dashboardBody
)#dashboardPage

