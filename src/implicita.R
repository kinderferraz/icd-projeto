## install.packages("arules")  # pacote de modelo (regra de associação)
## install.packages("arulesViz") # visualização de modelo (regra de associação)

library(arules)
library(arulesViz)

################################################################
### REGRA DE ASSOCIAÇÃO ENTRE POLUIÇÃO E VALORES DE ALUGUEL ####
################################################################
set.seed(123)
options(browser = "firefox")

prepared.df <- st_drop_geometry(aluguel.stations)  %>%
    select("Price", "Size", "Condo", "Negotiation.Type", "co", "no2", "particulado10", "particulado2.5")
aluguel.stations.rules <- as(prepared.df, "transactions")

rules <- apriori(aluguel.stations.rules,
                 parameter = list(supp=0.3, conf = 0.5,
                                  maxlen = 10,
                                  target = "rules"))

plot(rules, engine = "plotly")

plot(rules, method = "graph", engine = "htmlwidget")

## plot(rules, method = "paracoord")
