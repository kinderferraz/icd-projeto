library(dplyr)
library(sp)

################################################################
### BASE DE POLUICAO EM SP                                  ####
################################################################

## esta é uma tabela focada nas estações, com um registro para cada estações,
## selecionamos as estações em sp, e suas coordenadas e outras informações.
## Uma primeira leitura mostrou que estes campo são invariantes, de modo que
## foi preferível excluí-los (direto no select)
   ## > tipo_rede = as.factor(Tipo_Rede),
   ## > situacao_rede = as.factor(Situacao_Rede)
## os demais foram filtrados ao longo da análise da base, de modo que optei por
## deixá-los no transmute como forma de evidenciar a evolução do input
estacoes <- read.csv("trabalho/input/spAirPollution/estacoes-cetesb.csv/estacoes-cetesb.csv"
                     ## ,fileEncoding = "LATIN-1"
                     ) %>%
    select("ID", "Municipio", "Nome", "x", "y") %>%
    filter(Municipio == "SAO PAULO") %>%
    transmute(
        idt = ID
       ,nome = Nome
       ,x=x, y=y
       ## ,data = as.Date(DATA)
       ## ,indice = Indice
       ## ,poluente = as.factor(POLUENTE)
       ## ,qualidade = case_when(
       ##      Qualidade == "N1 - BOA" ~ "boa",
       ##      Qualidade == "N2 - MODERADA" ~ "moderada",
       ##      Qualidade == "N3 - RUIM" ~ "ruim",
       ##      )
       ## ,qualidade = as.factor(qualidade)
    )

head(estacoes)
str(estacoes)


## right join irá atuar como um filtro, mantendo apenas as linhas
## estiverem na 2 tabela (a do filtro)
pollution_records <- read.csv("trabalho/input/spAirPollution/cetesb.csv/cetesb.csv")  %>%
    select("time", "id", "CO", "NO2", "MP10", "MP2.5", "O3")  %>%
    right_join(estacoes, by = c("id" = "idt"))  %>%
    transmute(idt = id
             ,data = as.Date(time)
             ,nome = nome
             ,co = CO
             ,no2 = NO2
             ,particulado10 = MP10
             ,particulado2.5 = MP2.5
             ,ozonio = 03
              )

## considerando que a tabela tem 660101 registros
## selecionamos os poluentes com maior numero de registros
## uma análise temporal é necessária para avaliar se o registro é útil ou não
## > nrow(data[is.na(data$S02),])
## [1] 313627
##  > nrow(data[is.na(data$NO2),])
## [1] 288541
## > nrow(data[is.na(data$MP10),])
## [1] 133950
## > nrow(data[is.na(data$O3),])
## [1] 315185
## e alguns com um nomero menos completo
## > nrow(data[is.na(data$MP2.5),])
## [1] 469030
## > nrow(data[is.na(data$CO),])
## [1] 525893

## poluentes que não possuem registros suficientes
## serão descartados
## > nrow(data[is.na(data$BENZENO),])
## [1] 619220
## > nrow(data[is.na(data$TOLUENO),])
## [1] 619230
## > nrow(data[is.na(data$TRS),])
## [1] 624588


################################################################
### BASE DE ALUGUEIS EM SP                                  ####
################################################################
## essa base ta muito linda, direto do kaggle <3

aluguel <- read.csv("trabalho/input/realEstate/sp/spRealEstate_2019_04.csv") %>%
    mutate(
        Swimming.Pool = ifelse(Swimming.Pool == 1, TRUE, FALSE)
      , New = ifelse(New == 1, TRUE, FALSE)
      , Property.Type = ifelse(Property.Type == 1, TRUE, FALSE)
      , Furnished = ifelse(Furnished == 1, TRUE, FALSE)
      , Elevator = ifelse(Elevator == 1, TRUE, FALSE)
      , Negotiation.Type = as.factor(Negotiation.Type)
    )
