library(shiny)
library(shinydashboard)
library(ggplot2)
library(plotly)
library(shinyEffects)
source("data.R")

ui <- dashboardPage(
    
    dashboardHeader(title = "COVID-19 Sapiranga",
                    dropdownMenu(type = "notifications", # para colocar os nomes de quem fez o app  
                                 notificationItem(
                                     text = tags$div("Augusto Albineli de Souza",
                                                     style = "display: inline-block; vertical-align: middle;"),
                                     icon = icon("id-card"),
                                     status = "success"
                                 ), #notificationItem
                                 headerText = "Desenvolvido por"
                                 
                                ) #dropdownMenu  
                    ), #dashboardHeader
    
    dashboardSidebar(
        sidebarMenu(
            menuItem("Positivos", tabName = "positivos", icon = icon("plus-square")),
            menuItem("Ativos", tabName = "ativos", icon = icon("exclamation-triangle")),
            menuItem("Hospitalizados", tabName = "hospital", icon = icon("clinic-medical")),
            menuItem("Óbitos", tabName = "obitos", icon = icon("exclamation-circle")),
            menuItem("Curados", tabName = "curados", icon = icon("check"))
            
        ) #sidebarMenu
    ), #dashboardSidebar
    
    dashboardBody(
        tabItems(
            tabItem(tabName = "positivos",
                    
                    setZoom(id = "caixadia"),
                    setZoom(id = "caixapositivos"),
                    setZoom(id = "caixanpositivos"),
                    setZoom(id = "caixamaxpositivos"),
                    
                    fluidRow(
                        valueBoxOutput(width = 3, outputId = "caixadia"),
                        valueBoxOutput(width = 2, outputId = "caixapositivos"),
                        valueBoxOutput(width = 3, outputId = "caixanpositivos"),
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
                    
                    setZoom(id = "caixa2dia"),
                    setZoom(id = "caixanativos"),
                    setZoom(id = "caixamaxativos"),
                    
                    fluidRow(
                        valueBoxOutput(width = 4, outputId = "caixa2dia"),
                        valueBoxOutput(width = 4, outputId = "caixanativos"),
                        valueBoxOutput(width = 4, outputId = "caixamaxativos")
                        
                    ),#fluidRow1
                    
                    fluidRow(
                        box(
                            plotlyOutput(outputId = "ativos"), width=400)
                        
                    )#fluidRow2
            ), #tabItem_ativos
            
            tabItem(tabName = "hospital",
                    
                    setZoom(id = "caixa3dia"),
                    setZoom(id = "caixahospital"),
                    setZoom(id = "caixanhospital"),
                    setZoom(id = "caixamaxhospital"),
                    
                    fluidRow(
                        valueBoxOutput(width = 3, outputId = "caixa3dia"),
                        valueBoxOutput(width = 3, outputId = "caixahospital"),
                        valueBoxOutput(width = 3, outputId = "caixanhospital"),
                        valueBoxOutput(width = 3, outputId = "caixamaxhospital")
                        
                    ),#fluidRow1
                    
                    fluidRow(
                        box(
                            plotlyOutput(outputId = "hospital")),
                        box(
                            plotlyOutput(outputId = "nhospital"))
                    )#fluidRow2
            ), #tabItem_hospital
            
            tabItem(tabName = "obitos",
                    
                    setZoom(id = "caixa4dia"),
                    setZoom(id = "caixaobitos"),
                    setZoom(id = "caixanobitos"),
                    setZoom(id = "caixamaxobitos"),
                    
                    fluidRow(
                        valueBoxOutput(width = 3, outputId = "caixa4dia"),
                        valueBoxOutput(width = 3, outputId = "caixaobitos"),
                        valueBoxOutput(width = 3, outputId = "caixanobitos"),
                        valueBoxOutput(width = 3, outputId = "caixamaxobitos")
                        
                    ),#fluidRow1
                    
                    fluidRow(
                        box(
                            plotlyOutput(outputId = "obitos")),
                        box(
                            plotlyOutput(outputId = "nobitos"))
                    )#fluidRow2
            ), #tabItem_obitos
            
            tabItem(tabName = "curados",
                    
                    setZoom(id = "caixa5dia"),
                    setZoom(id = "caixacurados"),
                    setZoom(id = "caixancurados"),
                    setZoom(id = "caixamaxcurados"),
                    
                    fluidRow(
                        valueBoxOutput(width = 3, outputId = "caixa5dia"),
                        valueBoxOutput(width = 3, outputId = "caixacurados"),
                        valueBoxOutput(width = 3, outputId = "caixancurados"),
                        valueBoxOutput(width = 3, outputId = "caixamaxcurados")
                        
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

