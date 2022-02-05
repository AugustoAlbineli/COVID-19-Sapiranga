library(shiny)
library(ggplot2)
library(plotly)
source("data.R")


server <- function(input, output) {
    
    ## LINES
    output$positivos <- renderPlotly({
        plot <- plot.line(df, "DIA", "POSITIVOS")+
            labs(x="Dia", y="Casos positivos")
        ggplotly(plot)
    })    
    
    output$ativos <- renderPlotly({
        plot <- plot.line(df, "DIA", "ATIVOSC")+
            labs(x="Dia", y="Casos ativos")
        ggplotly(plot)
    })
    
    output$hospital <- renderPlotly({
        plot <- plot.line(df, "DIA", "HOSPITALIZADOS")+
            labs(x="Dia", y="Sapiranguenses internados em hospitais")
        ggplotly(plot)
    })
    
    output$inc_hospital <- renderPlotly({
        plot <- plot.line(df, "DIA", "inc_hosp")+
            labs(x="Dia", y="Incidência de hospitalizações")
        ggplotly(plot)
    })
    
    output$upa <- renderPlotly({
        plot <- plot.line(df, "DIA", "UPA")+
        labs(x="Dia", y="Sapiranguenses internados na UPA")
        ggplotly(plot)
    })
    
    output$obitos <- renderPlotly({
        plot <- plot.line(df, "DIA", "OBITOS")+
            labs(x="Dia", y="Óbitos totais")
        ggplotly(plot)
    })  
    
    output$inc_obitos <- renderPlotly({
        plot <- plot.line(df, "DIA", "inc_obito")+
            labs(x="Dia", y="Incidência de óbitos")
        ggplotly(plot)
    })
    
    output$curados <- renderPlotly({
        plot <- plot.line(df, "DIA", "CURADOS")+
            labs(x="Dia", y="Curados totais")
        ggplotly(plot)
    })  
    
    ## Barras
    
    output$npositivos <- renderPlotly({
        plot <- plot.bar(df, "DIA", "NOVOSCASOS")+
            labs(x="Dia", y="Novos casos por dia")
        ggplotly(plot)
    })    
    
    
    output$nhospital <- renderPlotly({
        plot <- plot.bar(df, "DIA", "NOVOSHOSPITALIZADOS")+
            labs(x="Dia", y="Novos hospitalizados por dia")
        ggplotly(plot)
    })
    
    output$nupa <- renderPlotly({
        plot <- plot.bar(df, "DIA", "NOVOUPA")+
            labs(x="Dia", y="Novos internados na UPA por dia")
        ggplotly(plot)
    })
    
    output$nobitos <- renderPlotly({
        plot <- plot.bar(df, "DIA", "NOVOSOBITOS")+
            labs(x="Dia", y="Novos óbitos por dia")
        ggplotly(plot)
    })  
    
    output$ncurados <- renderPlotly({
        plot <- plot.bar(df, "DIA", "NOVOSCURADOS")+
            labs(x="Dia", y="Novos curados por dia")
        ggplotly(plot)
    })  
    
    ###CAIXAS DE VALORES
    
    ###POSITIVOS
    
    output$caixapositivos <- renderValueBox({
        valueBox(max(df$POSITIVOS), "Casos positivos totais", color="teal"
        )
    })
    
    output$caixanpositivos <- renderValueBox({
        valueBox(df$NOVOSCASOS[count], "Novos casos positivos",color="navy"
        )
    })
    
    output$caixamaxpositivos <- renderValueBox({
        valueBox(max(df$NOVOSCASOS), "Maior número de casos positivos em um dia",color="light-blue"
        )
    })
    
    output$caixadia <- renderValueBox({
        valueBox(df$DIAS[count], "Dia",color="blue"
        )
    })
    
    ###ATIVOS
    
    
    output$caixamaxativos <- renderValueBox({
        valueBox(max(df$ATIVOSC), "Máximo de casos ativos",color="light-blue"
        )
    })
    
    output$caixanativos <- renderValueBox({
        valueBox(df$ATIVOSC[count], "Casos ativos hoje", color="teal"
        )
    })
    
    output$caixa2dia <- renderValueBox({
        valueBox(df$DIAS[count], "Dia",color="blue"
        )
    })
   
    ###HOSPITAL
    
    
   
    output$caixahospital <- renderValueBox({
        valueBox(df$HOSPITALIZADOS[count], "Hospitalizados hoje", color="teal"
        )
    })
    
    output$caixamaxhospital <- renderValueBox({
        valueBox(max(df$HOSPITALIZADOS), "Maior número de hospitalizados",color="light-blue"
        )
    })
    
    output$caixanhospital <- renderValueBox({
        valueBox(df$NOVOSHOSPITALIZADOS[count], "Diferença pro dia de ontem", color="navy"
        )
    })
    
    output$caixa3dia <- renderValueBox({
        valueBox(df$DIAS[count], "Dia",color="blue"
        )
    })
    
    
    ###UPA
    
    
    
    output$caixaupa <- renderValueBox({
        valueBox(df$UPA[count], "Pacientes na UPA", color="teal"
        )
    })
    
    output$caixamaxupa <- renderValueBox({
        valueBox(max(df$UPA), "Maior número de pacientes na UPA",color="light-blue"
        )
    })
    
    output$caixanupa <- renderValueBox({
        valueBox(df$NOVOUPA[count], "Diferença pro dia de ontem", color="navy"
        )
    })
    
    output$caixa8dia <- renderValueBox({
        valueBox(df$DIAS[count], "Dia",color="blue"
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
        valueBox(df$NOVOSOBITOS[count], "Óbitos no dia de hoje", color="navy"
        )
    })
    
    output$caixa4dia <- renderValueBox({
        valueBox(df$DIAS[count], "Dia",color="blue"
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
        valueBox(df$NOVOSCURADOS[count], "Curados no dia de hoje", color="navy"
        )
    })
    
    output$caixa5dia <- renderValueBox({
        valueBox(df$DIAS[count], "Dia",color="blue"
        )
    })
    
    
    #### DADOS GERAIS
    
    output$caixa9dia <- renderValueBox({
        infoBox("Dia",df2$DIAS[cte], color="blue", icon=icon("calendar-week")
        )
    })
    
    output$caixamonitorados <- renderValueBox({
        infoBox("Casos Monitorados", df2$MONITORADOS[cte],color="navy", icon=icon("eye")
        )
    })
    
    output$caixatestes <- renderValueBox({
        infoBox("Testes realizados", df2$TESTESREALIZADOS[cte],color="blue", icon=icon("vial")
        )
    })
    
    output$caixaaguardo <- renderValueBox({
        infoBox("Aguardando resultado", df2$AGUARDANDORESULTADO[cte],color="navy", icon=icon("spinner")
        )
    })
    
    output$caixaconfirmados <- renderValueBox({
        infoBox("Casos locais confirmados", df2$CONFIRMADOS[cte],color="blue", icon=icon("exclamation-triangle")
        )
    })
    
    output$caixanegativos <- renderValueBox({
        infoBox("Casos negativados", df2$NEGATIVOS[cte],color="navy", icon=icon("minus-circle")
        )
    })
    
    output$caixahospitalizados <- renderValueBox({
        infoBox("Sapiranguenses hospitalizados", df2$HOSPITAL[cte],color="blue", icon=icon("clinic-medical")
        )
    })
    
    output$caixapacienteupa <- renderValueBox({
        infoBox("Pacientes internados na UPA", df2$UPA[cte],color="navy", icon=icon("ambulance")
        )
    })
    
    output$caixarecuperados <- renderValueBox({
        infoBox("Curados", df2$CURADOS[cte],color="blue", icon=icon("check")
        )
    })
    
    output$caixaobito <- renderValueBox({
        infoBox("Óbitos", df2$OBITOS[cte],color="navy", icon=icon("exclamation-circle")
        )
    })
    
    
}#server