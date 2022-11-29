# Projeto de introdução a ciência de dados

## proposta

Este relatório procura estabelecer uma relação entre a poluição na cidade de São Paulo e tendências do mercado imobiliário da cidade. Para tanto, utilizamos uma base com o histórico de poluição desde 2013 e uma outra com um _snapshot_ do mercado imobiliário em abril de 2019. Esperamos demonstrar que locais com tendencia de alta poluição apresentam um mercado imobiliário menos oportuno e com menor valorização e estabelecer um modelo que permita localizar o valor de um imóvel com base na tendência de poluição da região onde ele se encontra.

## bases
As seguintes bases de dados foram utilizadas, ambas retiradas do _Kaggle_:

[Poluição do ar em são paulo desde 2013](https://www.kaggle.com/datasets/danlessa/air-pollution-at-so-paulo-brazil-since-2013)

[Mercado imobiliário de são paulo em abril de 2019](https://www.kaggle.com/datasets/argonalyst/sao-paulo-real-estate-sale-rent-april-2019)

Considerando o tamanho das bases, foram incluidos os arquivos compactados no diretório [bases](https://github.com/kinderferraz/icd-projeto/tree/master/bases).  
Sendo assim, será necessário baixá-las e descompactar os arquivos nos seguintes locais:
- poluição: ./input/spAirPollution/
- mercado imobiliário: ./input/realEstate/sp
