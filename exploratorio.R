# Conjunto de datos: https://archive.ics.uci.edu/ml/machine-learning-databases/car/
# UCI: https://archive.ics.uci.edu/ml/datasets/car+evaluation
# Alternativa para cargar el archivo
cars <- read.csv(file.choose(), header = TRUE)

# Para obtener informacion sobre las dimensiones del conjunto de datos podemos usar el siguiente comando.
dim(cars)

# Para buscar informacion sobre el conjunto de datos
?cars

# Para realizar analisis exploratorio de la data
summary(cars)

# Para imprimir las primeras 50 lineas con las cabeceras
head(cars, n=50L)

# Para visualizar la estructura del objeto de datos
str(cars)

# verificar valores faltantes o en blanco
table(is.na(cars))

# Hacer lo mismo con el conjunto de datos Iris
# https://archive.ics.uci.edu/ml/datasets/iris
library(MASS)

# Ejecutar este comando e indicar ¿porque la salida es distinta cuando se aplica a 
# cars?
summary(iris)

# Alternativas para cargar el paquete o libreria. 
install.packages("randomForest")
library(randomForest)
