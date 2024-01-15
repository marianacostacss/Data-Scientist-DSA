# Lista de Exercícios - Capítulo 3

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("C:/Users/Mariana/Desktop/Data-Scientist-DSA/R-e-Azure-ML/03-Estruturas-R")
getwd()

# Exercício 1 - Pesquise pela função que permite listar todos os arquivo no diretório de trabalho

dirtorio <- setwd("C:/Users/Mariana/Desktop/Data-Scientist-DSA/R-e-Azure-ML/03-Estruturas-R")
dirtorio
arquivos <- list.files(dirtorio)
arquivos

# Exercício 2 - Crie um dataframe a partir de 3 vetores: um de caracteres, um lógico e um de números

v1 <- c(1:5)
v1
v2 <- c(TRUE, FALSE, TRUE, FALSE, TRUE)
v2
v3 <- c("Marcia", "Doguinho", "Caramelo", "Fulano", "Ciclano")
v3

df <- data.frame(v1, v2, v3)
View(df)


# Exercício 3 - Considere o vetor abaixo. 

# Crie um loop que verifique se há números maiores que 10 e imprima o número e uma mensagem no console.


# Criando um Vetor
vec1 <- c(12, 3, 4, 19, 34, 10)
vec1


for (i in 1:length(vec1)) {
  if (vec1[i] > 10) {
    print(paste(i, "é maior que 10"))
  } else {
    print(paste(i, "é menor que 10"))
  }
}



# Exercício 4 - Conisdere a lista abaixo. Crie um loop que imprima no console cada elemento da lista
lst2 <- list(2, 3, 5, 7, 11, 13)
lst2


for (i in lst2) {
  print(i)
}

# Exercício 5 - Considere as duas matrizes abaixo. 
# Faça uma multiplicação element-wise e multiplicação normal entre as materizes
mat1 <- matrix(c(1:50), nrow = 5, ncol = 5, byrow = T)
mat1
mat2 <- t(mat1)
mat2

# Multiplicação element-wise

mat3 <-  mat1 * mat2
mat3

# Multiplicação de matrizes
#Cada linha por cada coluna vira coluna


mat4 <- mat1 %*% mat2
mat4
  
  

# Exercício 6 - Crie um vetor, matriz, lista e dataframe e faça a nomeação de cada um dos objetos

v <- c(1, 2, 3)
names(v) <- c("c1", "c2", "c3")
v


m <- matrix(c(1:30), nrow = 3, ncol = 2, byrow = T)
dimnames(m) <- list(c("l1", "l2", "l3"), c("c1", "c2"))
m


l <- c(1:3)
names(l) <- c("a", "b", "c")
l

df <- data.frame(c("a", "b"), c(2,4), c(TRUE, TRUE))
colnames(df) <- c("p", "c")
rownames(df) <- c("s", "F")

df



# Exercício 7 - Considere a matriz abaixo. Atribua valores NA de forma aletória para 50 elementos da matriz
# Dica: use a função sample()
mat2 <- matrix(1:90, 10)
mat2

?sample
mat2[sample(1:50, 10)] =NA
mat2





# Exercício 8 - Para a matriz abaixo, calcule a soma por linha e por coluna
mat10 <- matrix(c(1:50), nrow = 5, ncol = 5, byrow = T)
mat10


rowSums(mat10)
colSums(mat10)



# Exercício 9 - Para o vetor abaixo, ordene os valores em ordem crescente
a <- c(100, 10, 10000, 1000)
a


order(a)
a[order(a)]


# # Exercício 10 - Imprima no console todos os elementos da matriz abaixo que forem maiores que 15
mat1 <- matrix(c(1:50), nrow = 5, ncol = 5, byrow = T)
mat1




for (i in mat1) {
  if (i > 15) {
    print(i)
  }
}



