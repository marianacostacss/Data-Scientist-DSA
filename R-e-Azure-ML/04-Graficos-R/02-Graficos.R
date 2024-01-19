# Gráficos em R - Base Plotting System 

# Obs: Caso tenha problemas com a acentuação, consulte este link:
# https://support.rstudio.com/hc/en-us/articles/200532197-Character-Encoding

# Configurando o diretório de trabalho
# Coloque entre aspas o diretório de trabalho que você está usando no seu computador
# Não use diretórios com espaço no nome
setwd("C:/Users/Mariana/Desktop/Data-Scientist-DSA/R-e-Azure-ML/04-Graficos-R")
getwd()

# Lista de pacotes base carregados
search()


# Demonstra diferentes gráficos a partir de conjuntos de dados
demo("graphics")


# Plot Básico
x = 5:6
y = 8:10
plot(x,y)
?plot

altura <- c(145, 167, 176, 123, 150)
largura <- c(51, 63, 64, 40, 55)

plot(altura, largura)


# Plotando um Dataframe
?lynx
plot(lynx)
View(lynx)
plot(lynx, ylab = "Plots com Dataframes", xlab = "")
plot(lynx, ylab = "Plots com Dataframes", xlab = "Observações")
plot(lynx, main = "Plots com Dataframes", col = 'red')
plot(lynx, main = "Plots com Dataframes", col = 'red', col.main = 52, cex.main = 1.5)

library(datasets)
#cira um histograma da coluna breaks do dataset warpbreaks
hist(warpbreaks$breaks)


#criando um boxploto com aouro dataset
airquality
View(airquality)
transform(airquality, Month = factor(Month))
boxplot(Ozone ~ Month, airquality, xlab = "Month", ylab = "Ozone (ppb)")


# Especificando os parâmetros

# col - cor do plot
# lty - tipo de linha
# lwd - largura de linha
# pch - símbolo no plot
# xlab - label do eixo x
# ylab - label do eixo y
# las - como os labels dos eixos são orientados
# bg - background color
# mfrow - número de plots por linha
# mfcool - número de plots por coluna

# Funções Básicas de Plot

# plot() - scatterplots
# lines() -  adiciona linhas ao gráfico
# points() - adiciona pontos ao gráfico
# text() - adiciona label ao gráfico
# title() - adiciona título ao gráfico

# Parâmetros dos Gráficos
?par
par()
par('pch')
par('lty')

x = 2:4
plot(x, pch = "*")

par(mfrow = c(2,2), col.axis = "red") #duas linhas e duas colunas
plot(1:8, las = 0, xlab = "xlab", ylab = "ylab", main = "LAS = 0")
plot(1:8, las = 1, xlab = "xlab", ylab = "ylab", main = "LAS = 1")
plot(1:8, las = 2, xlab = "xlab", ylab = "ylab", main = "LAS = 2")
plot(1:8, las = 3, xlab = "xlab", ylab = "ylab", main = "LAS = 3")
legend("topright", pch = 1, col = c("violetred2", "springgreen1"), legend = c("Var1","Var2"))

par(mfrow = c(1,1)) #retorna às configuraçoes normais

# Cores disponíveis
colors()


### Salvando os gráficos

# cria png no diretório apontado anteriormente
png("Grafico1.png", width = 500, height = 500, res = 72) #res -> resolução

plot(iris$Sepal.Length, iris$Petal.Length,
     col = iris$Species,
     main = "Gráfico gerado a partir do Iris")

dev.off() #sempre que criar arquivo


# pdf
pdf("Grafico2.pdf")

plot(iris$Sepal.Length, iris$Petal.Length,
     col = iris$Species, #cada espécie vai receber uma cor
     main = "Gráfico gerado a partir do Iris")

dev.off()


# Estendendo as funções do plot
install.packages('plotrix')
library(plotrix)
?plotrix

par(mfrow = c(1,1), col.axis = "red")
plot(1:6, las = 3, xlab = "lty 1:6", ylab = "", main = "Mais opções ao plot")
ablineclip(v=1, lty=1, col="sienna2", lwd=2) #epresentar pontos específicos no eixo x
ablineclip(v=2, lty=1, col="sienna2", lwd=2) #lwd é largura de linha
ablineclip(v=3, lty=1, col="sienna2", lwd=2)
ablineclip(v=4, lty=1, col="sienna2", lwd=2)
ablineclip(v=5, lty=1, col="sienna2", lwd=2)
ablineclip(v=6, lty=1, col="sienna2", lwd=2)
ablineclip(v=7, lty=1, col="sienna2", lwd=2)


plot(lynx)
plot(lynx, type="p", main="Type p")
plot(lynx, type="l", main="Type l")
plot(lynx, type="b", main="Type b")
plot(lynx, type="o", main="Type o")
plot(lynx, type="h", main="Type h")
plot(lynx, type="s", main="Type s")
plot(lynx, type="n", main="Type n")

View(lynx)

 ?lynx


# Dois plots juntos
par(mar=c(3,3,3,3), col.axis="black") #mar controla as margens inferior, esquerda, superior e direita

plot(cars$speed, type="s", col="red", bty="n", xlab="Cars ID", ylab="")
#Cria um gráfico de linhas suaves (type="s") com a variável "speed" no eixo x e rótulo "Cars ID". 
#A cor das linhas é vermelha (col="red") e bty="n" remove a caixa ao redor do gráfico. O eixo y não possui rótulos (ylab="").
text(8, 14, "Velocidade", cex=0.85, col="red") # cex é tamanho de fonte
par(new=T) #prepara o programa pra sobreposição de outros gráficos

plot(cars$dist, type="s", bty="n", ann=F, axes=F, col="darkblue")
axis(side=4) #ann=F remove a anotação (título) e axes=F remove os eixos.
text(37, 18, "Distância", cex=0.85, col="darkblue") 

title(main="Velocidade x Distância")


# Plots a partir de datasets
df <- read.csv('pibpercap.csv', stringsAsFactors = F) #'stringsAsFactors = F evita que as variáveis de caracteres sejam convertidas automaticamente em fatores
df_1982 <- subset(df, ano == 1982)
plot(expectativa ~ pibpercap, data = df_1982, log = "x") #usando os dados do data frame df_1982. O argumento log = "x" especifica que a escala do eixo x deve ser logarítmica.
View(df)

# Nomes para as colunas
mycol <- c(Asia = "tomato", Europe = "chocolate4", Africa = "dodgerblue2", 
           Americas = "darkgoldenrod1", Oceania = "green4")

# Plot
plot(expectativa ~ pibpercap, data = df_1982, log = "x", col = mycol[continente]) #as cores serão definnidas com a correspondência do vetor mycol com a coluna continentes do df

# Função para definir o tamalho do ponto
mycex <- function(var, r, f = sqrt){
  x = f(var)
  x_scaled = (x - min(x))/(max(x) - min(x)) #Escala os valores de x para o intervalo [0, 1].
  r[1] + x_scaled * (r[2] - r[1])
}

# Plot
plot(expectativa ~ pibpercap, data = df_1982, log = "x",
     col = mycol[continente],
     cex = mycex(pop, r = c(0.2, 10))
)


