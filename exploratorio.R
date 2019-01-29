# Para obtener informacion sobre las dimensiones del conjunto de datos podemos usar el siguiente comando.
dim(Boston)

# Para buscar informacion sobre el conjunto de datos
?Boston

# Alternativas para cargar el paquete o libreria. 
# Data Source: https://archive.ics.uci.edu/ml/machine-learning-databases/car/
install.packages("randomForest")
library(randomForest)

# Alternativa para cargar el archivo
cars <- read.csv(file.choose(), header = TRUE)

# Para realizar analisis exploratorio de la data
summary(cars)

# Para imprimir las primeras 50 lineas con las cabeceras
head(cars, n=50L)

# Para visualizar la estructura del objeto de datos
str(cars)
