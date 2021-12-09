################################################################################
############################### GOOGLE PLAY STORE ##############################
################################################################################
# URL de DataBase
# https://www.kaggle.com/lava18/google-play-store-apps/version/6

################################################################################
################################## LIBRERIAS ###################################
################################################################################
library(dplyr)

################################################################################
# Obtener ruta del directorio actual.
getwd()
dir ()

# Fijacion y validacion de directorio de trabajo.
setwd("/home/mafia/Programacion-R-/Google PlayStore/DataSet/")
getwd()
dir()

# Utilizando funcion read.csv para leer fichero .csv
read.csv("googleplaystore.csv")

# Se asigna a un objeto el fichero
datosgoogle <- read.csv("googleplaystore.csv")

# informacion del objeto
class(datosgoogle)   # Tipo de dato
glimpse(datosgoogle) # Explorar Rows and Columns
summary(datosgoogle) # Reconocer posibles errores

# Explorar el tipo de variables
glimpse(datosgoogle)

# Obtener el nombre de las columnas
colnames(datosgoogle)

# Obtener minimo y maximo de cada columna por separado
apply(datosgoogle,2,min)
apply(datosgoogle,2,max)

# Obtener minimo y maximo de cada columna
apply(datosgoogle, 2, range)

# Se observa que hay un error en Last.Update 
# Se identifica la fila 10473 como corrupta y se elimina
datoS <- datosgoogle[-10473,]
str(datoS)

# Obtener minimo y maximo de cada columna sin fila 10473
apply(datoS, 2, range)

#se elimina la columna Current.Ver por informacion indeseable
datoS <- datosgoogle[-10473,-12]
str(datoS)
apply(datoS, 2, range)

#Eliminar version de android
#corregir formato fecha y hora 
#renombrar columnas
#valores NAN en ratin
