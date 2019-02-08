# Importamos la libreria para usar el randomForest
require(randomForest)

# Importamos el paquete que contiene el conjunto de datos que queremos analizar (Modern Applied Statistics with S). 
# R (>= 3.1.0)
#require(MASS)

# Abrimos el archivo desde el explorador de la pc con el comando a continuacion.
cars <- read.csv(file.choose(), header = TRUE)

# Asignamos la semilla.
set.seed(101)

# Creando conjunto de entrenamiento con 300 observaciones. Por defecto el muestreo es sin reemplazo.
entrenamiento=sample(1:nrow(cars),300)
# Otra forma. Se crea el conjunto de entrenamiento y validacion con split 70:30 (cross-validation).
entrenamiento <- sample(nrow(cars), 0.7*nrow(cars), replace = FALSE)
conjuntoEntrenamiento <- cars[entrenamiento,]
conjuntoValidacion <- cars[-entrenamiento,]

# Se realizara la prediccion sobre la variable condition. Se usan los predictores del conjunto de datos.
cars.rf=randomForest(Condition ~  BuyingPrice + Maintenance, data = cars , subset = entrenamiento)

# Generar el modelo, usando los parametros por defecto. 
modeloCars <- randomForest(Condition ~  BuyingPrice + Maintenance, data = conjuntoEntrenamiento, importance = TRUE)

# Parametros configurados 
modeloCars2 <- randomForest(Condition ~  BuyingPrice + Maintenance, data = conjuntoEntrenamiento, ntree = 500, mtry = 6, importance = TRUE)

# Se realiza prediccion en conjuntos de entrenamiento y validacion
predEntrenamiento <- predict(modeloCars2, conjuntoEntrenamiento, type = "class")
table(predEntrenamiento, conjuntoEntrenamiento$Condition)

predValidacion <- predict(modeloCars2, conjuntoValidacion, type = "class")

mean(predValidacion==conjuntoValidacion$Condition)

table(predValidacion, conjuntoValidacion$Condition)

# Prediccion de un nuevo dato


#Visualizacion de error vs. numero de arboles

plot(modeloCars2)


