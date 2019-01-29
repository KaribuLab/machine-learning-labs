# Importamos la libreria para usar el randomForest
require(randomForest)

# Importamos el paquete que contiene el conjunto de datos que queremos analizar (Modern Applied Statistics with S). 
# R (>= 3.1.0)
#require(MASS)

# Aplicamos la funcion attach para acceder a los objetos del dataframe boston (Housing Values in Suburbs of Boston).
#attach(Boston)

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

# Se realizara la prediccion sobre la variable medv. Se usan los predictores del conjunto de datos.
#cars.rf=randomForest(Condition ~ . , data = cars , subset = entrenamiento)

# otra forma de generar el modelo, usando los parametros por defecto tambien. 
modeloCars <- randomForest(Condition ~ ., data = conjuntoEntrenamiento, importance = TRUE)

# Parametros configurados 
modeloCars2 <- randomForest(Condition ~ ., data = conjuntoEntrenamiento, ntree = 500, mtry = 6, importance = TRUE)




