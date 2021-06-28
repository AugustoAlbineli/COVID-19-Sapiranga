library(shiny)
library(ggplot2)
library(plotly)
source("data.R")


server <- function(input, output) {
    
    ## LINES
    output$positivos <- renderPlotly({
        plot <- plot.line(df, "DIA", "POSITIVOS" , "DIA", "POSITIVOS","Casos Positivos")
        ggplotly(plot)
    })    
    
    output$ativos <- renderPlotly({
        plot <- plot.line(df, "DIA", "ATIVOSC" , "DIA", "ATIVOS","Casos Ativos")
        ggplotly(plot)
    })
    
    output$hospital <- renderPlotly({
        plot <- plot.line(df, "DIA", "HOSPITALIZADOS" , "DIA", "HOSPITALIZADOS","Hospitalizados")
        ggplotly(plot)
    })
    
    output$obitos <- renderPlotly({
        plot <- plot.line(df, "DIA", "OBITOS" , "DIA", "ÓBITOS","Óbitos")
        ggplotly(plot)
    })  
    
    output$curados <- renderPlotly({
        plot <- plot.line(df, "DIA", "CURADOS" , "DIA", "CURADOS","Curados")
        ggplotly(plot)
    })  
    
    ## Barras
    
    output$npositivos <- renderPlotly({
        plot <- plot.bar(df, "DIA", "NOVOSCASOS" , "DIA", "NOVOSCASOS","Novos casos")
        ggplotly(plot)
    })    
    
    
    output$nhospital <- renderPlotly({
        plot <- plot.bar(df, "DIA", "NOVOSHOSPITALIZADOS" , "DIA", "NOVOSHOSPITALIZADOS","Hospitalizados")
        ggplotly(plot)
    })
    
    output$nobitos <- renderPlotly({
        plot <- plot.bar(df, "DIA", "NOVOSOBITOS" , "DIA", "NOVOSÓBITOS","Óbitos")
        ggplotly(plot)
    })  
    
    output$ncurados <- renderPlotly({
        plot <- plot.bar(df, "DIA", "NOVOSCURADOS" , "DIA", "NOVOSCURADOS","Curados")
        ggplotly(plot)
    })  
    
    ###CAIXAS DE VALORES
    
    ###POSITIVOS
    
    output$caixapositivos <- renderValueBox({
        valueBox(max(df$POSITIVOS), "Casos positivos totais", color="teal"
        )
    })
    
    output$caixanpositivos <- renderValueBox({
        valueBox(df$CASOSHJ[1], "Novos casos positivos",color="navy"
        )
    })
    
    output$caixamaxpositivos <- renderValueBox({
        valueBox(max(df$NOVOSCASOS), "Maior número casos positivos em um dia",color="light-blue"
        )
    })
    
    output$caixadia <- renderValueBox({
        valueBox(df$DIAHJ[1], "Dia",color="blue"
        )
    })
    
    ###ATIVOS
    
    
    output$caixamaxativos <- renderValueBox({
        valueBox(max(df$ATIVOSC), "Máximo de casos ativos",color="light-blue"
        )
    })
    
    output$caixanativos <- renderValueBox({
        valueBox(df$ATIVOSHJ[1], "Casos ativos hoje", color="teal"
        )
    })
    
    output$caixa2dia <- renderValueBox({
        valueBox(df$DIAHJ[1], "Dia",color="blue"
        )
    })
   
    ###HOSPITAL
    
    
   
    output$caixahospital <- renderValueBox({
        valueBox(df$HOSPHJ[1], "Hospitalizados hoje", color="teal"
        )
    })
    
    output$caixamaxhospital <- renderValueBox({
        valueBox(max(df$HOSPITALIZADOS), "Maior número de hospitalizados",color="light-blue"
        )
    })
    
    output$caixanhospital <- renderValueBox({
        valueBox(df$NOVOHOSPHJ[1], "Diferença pro dia de ontem", color="navy"
        )
    })
    
    output$caixa3dia <- renderValueBox({
        valueBox(df$DIAHJ[1], "Dia",color="blue"
        )
    })
    
    
    ###ÓBITOS
    
    output$caixaobitos <- renderValueBox({
        valueBox(max(df$OBITOS), "Óbitos", color="teal"
        )
    })
    
    output$caixamaxobitos <- renderValueBox({
        valueBox(max(df$NOVOSOBITOS), "Maior número de óbitos em um dia",color="light-blue"
        )
    })
    
    output$caixanobitos <- renderValueBox({
        valueBox(df$OBITOSHJ[1], "Óbitos no dia de hoje", color="navy"
        )
    })
    
    output$caixa4dia <- renderValueBox({
        valueBox(df$DIAHJ[1], "Dia",color="blue"
        )
    })
    
    ###CURADOS
    
    
    output$caixacurados <- renderValueBox({
        valueBox(max(df$CURADOS), "Curados", color="teal"
        )
    })
    
    output$caixamaxcurados <- renderValueBox({
        valueBox(max(df$NOVOSCURADOS), "Maior número de curados em um dia",color="light-blue"
        )
    })
    
    output$caixancurados <- renderValueBox({
        valueBox(df$CURADOSHJ[1], "Curados no dia de hoje", color="navy"
        )
    })
    
    output$caixa5dia <- renderValueBox({
        valueBox(df$DIAHJ[1], "Dia",color="blue"
        )
    })
}#server