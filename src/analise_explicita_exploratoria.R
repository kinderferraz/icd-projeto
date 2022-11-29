##### análise explícita e exploratória dos dados de poluição

summary(pollution_records)

# tratando dados missing da coluna de co
tratado <- pollution_records %>% drop_na(co)

# somando o total de co registrado por dia
agr <- aggregate(tratado["co"], by=tratado["data"], sum)
head(agr)

# summary(agr)
# boxplot(agr$co)
co_plot <- ggplot(agr, aes(x=co)) + geom_density()

# tratando dados missing da coluna de no2 
tratado <- pollution_records %>% drop_na(no2)

# somando o total de co registrado por dia
agr <- aggregate(tratado["no2"], by=tratado["data"], sum)

# summary(agr)
# boxplot(agr$no2)
no2_plot <- ggplot(agr, aes(x=no2)) + geom_density()

# tratando dados missing da coluna de particulado10 
tratado <- pollution_records %>% drop_na(particulado10)

# somando o total de co registrado por dia
agr <- aggregate(tratado["particulado10"], by=tratado["data"], sum)

# summary(agr)
# boxplot(agr$particulado10)
particulado10_plot <- ggplot(agr, aes(x=particulado10)) + geom_density()

# tratando dados missing da coluna de particulado2.5 
tratado <- pollution_records %>% drop_na(particulado2.5)

# somando o total de co registrado por dia
agr <- aggregate(tratado["particulado2.5"], by=tratado["data"], sum)

# summary(agr)
# boxplot(agr$particulado2.5)
particulado2.5_plot <- ggplot(agr, aes(x=particulado2.5)) + geom_density()

# tratando dados missing da coluna de ozonio 
tratado <- pollution_records %>% drop_na(ozonio)

# somando o total de co registrado por dia
agr <- aggregate(tratado["ozonio"], by=tratado["data"], sum)

# summary(agr)
# boxplot(agr$ozonio)
ozonio_plot <- ggplot(agr, aes(x=ozonio)) + geom_density()

# comparando gráficos
plot_grid(co_plot, no2_plot, particulado10_plot, particulado2.5_plot, ozonio_plot, labels = "AUTO") # visualização



##### análise explícita e exploratória dos dados de alugueis



# selecionar apenas os registros de aluguel
apenas_alugueis <- aluguel %>% filter(`Negotiation Type` == "rent")
head(apenas_alugueis)

summary(apenas_alugueis)

# gráfico preço x tamanho x mobiliado
apenas_alugueis_plot <- ggplot(apenas_alugueis,aes(Price,Size,color=Furnished))+
  geom_jitter()
apenas_alugueis_plot

# gráfico preço x quantidade de quartos x mobiliado
apenas_alugueis_plot <- ggplot(apenas_alugueis,aes(Price,Rooms,color=Furnished))+
  geom_jitter()
apenas_alugueis_plot

# gráfico preço x quantidade de quartos x suites
apenas_alugueis_plot <- ggplot(apenas_alugueis,aes(Price,Suites,color=Furnished))+
  geom_jitter()
apenas_alugueis_plot

# gráfico preço x quantidade de quartos x quantidade de vagas de estacionamento
apenas_alugueis_plot <- ggplot(apenas_alugueis,aes(Price,Parking,color=Furnished))+
  geom_jitter()
apenas_alugueis_plot

# gráfico de quartos
apenas_alugueis_plot <- ggplot(apenas_alugueis,aes(x=Rooms))+
  geom_bar()
apenas_alugueis_plot
