# Lista de Exercícios - Capítulo 2

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("C:\Users\Mariana\Desktop\Data-Scientist-DSA\R-e-Azure-ML\02-Fundamentos-R")
getwd()

# Exercício 1 - Crie um vetor com 30 números inteiros

vetor <- c(1:30)
vetor

# Exercício 2 - Crie uma matriz com 4 linhas e 4 colunas preenchida com números inteiros

?matrix
mat = matrix(data = 1 : 16, nrow = 4, ncol = 4, byrow = T)
mat

# Exercício 3 - Crie uma lista unindo o vetor e matriz criados anteriormente

lista = list(vetor, mat)
lista

# Exercício 4 - Usando a função read.table() leia o arquivo do link abaixo para uma dataframe
# http://data.princeton.edu/wws509/datasets/effort.dat


# Instale e carregue a biblioteca necessária para fazer o download do arquivo
install.packages("RCurl")
library(RCurl)

# Defina o URL do arquivo
url <- "http://data.princeton.edu/wws509/datasets/effort.dat"

# Use a função getURL() para baixar o conteúdo do arquivo
file_content <- getURL(url)

# Crie um objeto de texto para leitura com read.table()
text_data <- textConnection(file_content)

# Leia os dados usando read.table()
df <- read.table(text_data, header = TRUE)

# Feche a conexão de texto
close(text_data)

#  !!! URL parece incorreta

print('-----------')

print('Devido a erro no link, trabalharemos com o conjunto Iris')

df = iris
head(df)

DataFrame = df[,1:3]

head(DataFrame)

# Exercício 5 - Transforme o dataframe anterior, em um dataframe nomeado com os seguintes labels:
# c("config", "esfc", "chang")


names(DataFrame) <- c("config", "esfc", "chang")

head(DataFrame)

# Exercício 6 - Imprima na tela o dataframe iris, verifique quantas dimensões existem no dataframe iris e imprima um resumo do dataset

View(iris)
head(iris)
summary(iris)

# Exercício 7 - Crie um plot simples usando as duas primeiras colunas do dataframe iris
# Crie um gráfico de dispersão usando as duas primeiras colunas do dataframe iris

plot(iris$Sepal.Length, iris$Sepal.Width, col = iris$Species, pch = 16, main = "Sepal Length vs Sepal Width", xlab = "Sepal Length", ylab = "Sepal Width")
legend("topright", legend = levels(iris$Species), col = 1:3, pch = 16)


# Exercício 8 - Usando a função subset, crie um novo dataframe com o conjunto de dados do dataframe iris em que Sepal.Length > 7
# Dica: consulte o help para aprender como usar a função subset()

help(subset)

subset(iris, Sepal.Length > 7, select = c(Sepal.Length, Species), drop = FALSE)

# Exercícios 9 (Desafio) - Crie um dataframe que seja cópia do dataframe iris e usando a função slice(), divida o dataframe em um subset de 15 linhas
# Dica 1: Você vai ter que instalar e carregar o pacote dplyr
# Dica 2: Consulte o help para aprender como usar a função slice()

install.packages("dplyr")
library(dplyr)

?slice

iris_copia <- iris

# Use a função slice para criar um subset com 15 linhas
subset_15_linhas <- iris_copia %>% slice(1:15) # %>% une as duas partes do código (encademaneto de comando)

# Exibir o subset resultante
print(subset_15_linhas)


# Exercícios 10 - Use a função filter no seu novo dataframe criado no item anterior e retorne apenas valores em que Sepal.Length > 6
# Dica: Use o RSiteSearch para aprender como usar a função filter

?filter

subset_sepal_length_gt_6 <- iris_copia %>% filter(Sepal.Length > 6)
print(subset_sepal_length_gt_6)
