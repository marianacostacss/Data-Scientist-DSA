# Gráficos de Pizza 

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("C:/Users/Mariana/Desktop/Data-Scientist-DSA/R-e-Azure-ML/04-Graficos-R")
getwd()

?pie

# Criando as fatias
fatias = c(40, 20, 40)

# Nomeando os labels
paises = c("Brasil", "Argentina", "Chile")

# Unindo paises e fatias
paises = paste(paises, fatias)

# Incluindo mais detalhes no label
paises = paste(paises, "%", sep = "") #sem espaço

View(paises)

colors()

# Construindo um gráfico
pie(fatias, labels = paises,
    col = c("darksalmon", "gainsboro", "lemonchiffon4"), 
    main ="Dsitribuição de Vendas")


# Trabalhando com dataframes
?iris
attach(iris) #fixa esse df, podendo se referir somente às colunas
Values = table(Species) #cria um atabela com a contagem das espécies
View(Values)

labels = paste(names(Values)) #cria conjunto com nomes das espécies
View(labels)

pie(Values, labels = labels, main = "Distribuição de Espécies")

legenda

# 3D
install.packages("plotrix")
library(plotrix)

pie3D(fatias, labels = labels, explode = 0.07, #explode é a distância das fatias
      col = c("steelblue1", "tomato2", "tan3"), 
      main = "Dsitribuição de Vendas")


