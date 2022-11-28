# Projeto de introdução a ciência de dados

## proposta

Este trabalho procura estabelecer uma relação entre a polução na cidade de são paulo
e tendências do mercado imobiliário da cidade. Para tanto, usamos uma base com histórico
de polução desde 2013 e uma outra com um _snapshot_ do mercado imobiliário para abril/19.
Esperamos demonstrar que locais com tendencia de alta poluição apresenta um mercado
imobiliário menos oportuno e com menor valorização, e estabelecer um modelo que
permita localizar o valor de um imóvel com base na tendência de poluição da região onde
ele se encontra.

## bases
As bases usadas foram as seguintes
[Polução do ar em são paulo desde 2013](https://www.kaggle.com/datasets/danlessa/air-pollution-at-so-paulo-brazil-since-2013)
e
[Mercado imobiliário de são paulo em abril de 2019](https://www.kaggle.com/datasets/argonalyst/sao-paulo-real-estate-sale-rent-april-2019)

Considerando o tamanho das bases, não foi possível incluí-las no github.
Assim é necessário baixá-las e descompactar os arquivos nos seguintes locais:
- poluição: ./input/spAirPollution/
- mercado imobiliário: ./input/realEstate/sp
