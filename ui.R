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
            menuItem("Dados gerais", tabName="gerais", icon=icon("info-circle")),
            menuItem("Positivos", tabName = "positivos", icon = icon("plus-square")),
            menuItem("Ativos", tabName = "ativos", icon = icon("exclamation-triangle")),
            menuItem("Hospitalizados", tabName = "hosp", icon = icon("clinic-medical"),
                menuSubItem("Hospital", tabName = "hospital", icon = icon("clinic-medical")),
                menuSubItem("UPA", tabName = "upa", icon = icon("ambulance"))),
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
                        box(background = "black", title = "Positivos totais",
                            plotlyOutput(outputId = "positivos")),
                        box(background = "black", title = "Positivos por dia",
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
                        box(background = "black", title = "Ativos por dia",
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
                        box(background = "black", title = "Hospitalizados totais",
                            plotlyOutput(outputId = "hospital")),
                        box(background = "black", title = "Hospitalizados por dia",
                            plotlyOutput(outputId = "nhospital"))
                    ),#fluidRow2
                    
                    fluidRow(width=12,
                        box(background = "black", title = "Incidência de hospitalizações",
                            plotlyOutput(outputId = "inc_hospital"),width=400)
                    )#fluidRow3
                    
                    
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
                        box(background = "black", title = "Óbitos totais",
                            plotlyOutput(outputId = "obitos")),
                        box(background = "black", title = "Óbitos por dia",
                            plotlyOutput(outputId = "nobitos"))
                    ),#fluidRow2
                    
                    
                    fluidRow(width=12,
                             box(background = "black", title = "Incidência de óbitos",
                                 plotlyOutput(outputId = "inc_obitos"),width=400)
                    )#fluidRow3
                    
                    
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
                        box(background = "black", title = "Curados totais",
                            plotlyOutput(outputId = "curados")),
                        box(background = "black", title = "Curados por dia",
                            plotlyOutput(outputId = "ncurados"))
                    )#fluidRow
            ), #tabItem_curados
            
            tabItem(tabName = "upa",
                    
                    setZoom(id = "caixa8dia"),
                    setZoom(id = "caixaupa"),
                    setZoom(id = "caixanupa"),
                    setZoom(id = "caixamaxupa"),
                    setZoom(id = "caixaconfirmados"),
                    setZoom(id = "caixanegativos"),
                    
                    fluidRow(
                        valueBoxOutput(width = 3, outputId = "caixa8dia"),
                        valueBoxOutput(width = 3, outputId = "caixaupa"),
                        valueBoxOutput(width = 3, outputId = "caixanupa"),
                        valueBoxOutput(width = 3, outputId = "caixamaxupa")
                        
                    ),#fluidRow1
                    
                    fluidRow(
                        box(background = "black", title = "Total de pacientes na UPA",
                            plotlyOutput(outputId = "upa")),
                        box(background = "black", title = "Pacientes na UPA por dia",
                            plotlyOutput(outputId = "nupa"))
                    )#fluidRow2
            ), #tabItem_upa
            
            tabItem(tabName = "gerais",
                    titlePanel("Boletim epidemiológico do Coronavírus em Sapiranga"),
                    
                    setZoom(id = "caixa9dia"),
                    setZoom(id = "caixamonitorados"),
                    setZoom(id = "caixatestes"),
                    setZoom(id = "caixaaguardo"),
                    setZoom(id = "caixaconfirmados"),
                    setZoom(id = "caixanegativos"),
                    setZoom(id = "caixahospitalizados"),
                    setZoom(id = "caixapacienteupa"),
                    setZoom(id = "caixarecuperados"),
                    setZoom(id = "caixaobito"),
                  
                    
                    fluidRow(
                        infoBoxOutput(width = 6, outputId = "caixa9dia"),
                        infoBoxOutput(width = 6, outputId = "caixamonitorados")
                        
                    ),#fluidRow_1
                    
                    fluidRow(
                        infoBoxOutput(width = 6, outputId = "caixatestes"),
                        infoBoxOutput(width = 6, outputId = "caixaaguardo")
                        
                    ),#fluidRow_2
                    
                    fluidRow(
                        infoBoxOutput(width = 6, outputId = "caixaconfirmados"),
                        infoBoxOutput(width = 6, outputId = "caixanegativos")
                        
                    ),#fluidRow_3
                    
                    fluidRow(
                        infoBoxOutput(width = 6, outputId = "caixahospitalizados"),
                        infoBoxOutput(width = 6, outputId = "caixapacienteupa")
                        
                    ),#fluidRow_4
                    
                    fluidRow(
                        infoBoxOutput(width = 6, outputId = "caixarecuperados"),
                        infoBoxOutput(width = 6, outputId = "caixaobito")
                        
                    )#fluidRow_5
                    
            ) #tabItem_gerais
            
        )#tabItems
    )#dashboardBody
)#dashboardPage

