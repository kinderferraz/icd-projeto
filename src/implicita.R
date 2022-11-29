## install.packages("arules")  # pacote de modelo (regra de associação)
## install.packages("arulesViz") # visualização de modelo (regra de associação)

library(arules)
library(arulesViz)
library(htmlwidgets)

################################################################
### REGRA DE ASSOCIAÇÃO ENTRE POLUIÇÃO E VALORES DE ALUGUEL ####
################################################################
set.seed(123)
options(browser = "firefox")

prepared.df <- st_drop_geometry(aluguel.stations)  %>%
    select("Price", "Size", "Condo", "Negotiation.Type", "co", "no2", "particulado10", "particulado2.5") %>%
    group_by(Negotiation.Type)  %>%
    group_split()

aluguel.stations.rules <- select(prepared.df[[1]], -Negotiation.Type)  %>%
    as("transactions")

vendas.stations.rules <- select(prepared.df[[2]], -Negotiation.Type) %>%
    as("transactions")

rules.aluguel <- apriori(aluguel.stations.rules,
                          parameter = list(supp=0.3, conf = 0.5,
                                           maxlen = 10,
                                           target = "rules"))
rules.sales <- apriori(vendas.stations.rules,
                       parameter = list(supp=0.3, conf = 0.5,
                                        maxlen = 10, target = "rules"))

saveWidget(plot(rules.aluguel, engine = "plotly"), file = "output/rentRules.html")
saveWidget(plot(rules.sales, engine = "plotly"), file = "output/saleRules.html")

saveWidget(plot(rules.aluguel, method = "graph", engine = "htmlwidget"), file = "output/rentRulesGraph.html")
saveWidget(plot(rules.sales, method = "graph", engine = "htmlwidget"), file = "output/salesRulesGraph.html")

plot(rules.aluguel, method = "paracoord")
savePlot(filename = "output/rentParacoord.png", type="png")

plot(rules.sales, method = "paracoord")
savePlot(filename = "output/salesParacoord.png", type="png")
