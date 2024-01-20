# Histogramas 

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("C:/Users/Mariana/Desktop/Data-Scientist-DSA/R-e-Azure-ML/04-Graficos-R")
getwd()

# Definindo os dados
?cars
View(cars)
dados = cars$speed

# Construindo um histograma
?hist
hist(dados)


# Conforme consta no help, o parâmetro breaks pode ser um dos itens abaixo:
# Um vetor para os pontos de quebra entre as células do histograma
# Uma função para calcular o vetor de breakpoints
# Um único número que representa o número de células para o histograma
# Uma cadeia de caracteres que nomeia um algoritmo para calcular o número de células 
# Uma função para calcular o número de células.
hist(dados, breaks = 10, main = "Histograma das Velocidades")
hist(dados, labels = T, breaks = c(0,5,10,20,30), main = "Histograma das Velocidades")
hist(dados, labels = T, breaks = 10, main = "Histograma das Velocidades")
hist(dados, labels = T, ylim = c(0,10), breaks = 10, main = "Histograma das Velocidades")


# Adicionando linhas ao histograma
grafico <- hist(dados, breaks = 10, main = "Histograma das Velocidades")

xaxis = seq(min(dados), max(dados), length = 10) #vetor da sequencia de mínimo a máximo com 10 pontos igualmente espaçados
yaxis = dnorm(xaxis, mean = mean(dados), sd = sd(dados)) #Calcula os valores da densidade normal para os pontos em xaxis. Os 
#parâmetros mean e sd são estimados a partir dos dados fornecidos.
yaxis = yaxis*diff(grafico$mids)*length(dados)
#Ajusta os valores da densidade normal (yaxis) para que a área sob a curva seja proporcional ao número total de dados, 
#de modo a combinar com a escala do histograma.
lines(xaxis, yaxis, col = "red")



