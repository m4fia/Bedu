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
BaseDatosDescargada <- read.csv("googleplaystore.csv")

# informacion del objeto
class(BaseDatosDescargada)       # Tipo de dato
object.size(BaseDatosDescargada) #Tama;o del archivo
glimpse(BaseDatosDescargada)     # Explorar Rows and Columns
colnames(BaseDatosDescargada)    # Obtener el nombre de las columnas

# Obtener resumen de dataframe
summary(BaseDatosDescargada)
# Obtener minimo y maximo de cada columna
apply(BaseDatosDescargada, 2, range)

# Se observa que hay un error en Last.Update 
# Se identifica error en la fila 10473 y se elimina
# Se elimina la columna Current.Ver; Andoid.Ver; Content.Rating;Reviews 
BaseDatosDescargadaScolumnasSfila <- BaseDatosDescargada[-10473,c(-13,-12,-9,-4)]
str(BaseDatosDescargadaScolumnasSfila)
summary(BaseDatosDescargadaScolumnasSfila)
################################################################################
# Se identifican filas repetidas
# 
BaseDatosValoresRepetidos <- data.frame(BaseDatosDescargadaScolumnasSfila[,])
# Eliminacion de datos duplicados
BaseDatoSR<- BaseDatosValoresRepetidos %>% group_by(App) %>% filter (! duplicated(App))
summary(BaseDatoSR)

# Grafica de barras / Categorias
#Categorias
plot(BaseDatoSR$Category, main = "Gráfico de Barras Category",
     xlab = "Categoria", ylab = "Frecuencia",
     col = "blue",
     ylim = c(0, 2000))

#Grafica de Barras / Rating
table(BaseDatoSR$Rating)
tabla_Rating <- table(BaseDatoSR$Rating)
# Resultado
tabla_Rating
barplot(tabla_Rating,main = "Gráfico de barras : Rating", 
        xlab = "Rating", 
        ylab = "Frecuencia",
        col = "blue",
        ylim = c(0, 1000))

#Grafica de Barras / Installs
table(BaseDatoSR$Installs)
tabla_Installs <- table(BaseDatoSR$Installs)
# Resultado
tabla_Installs

barplot(tabla_Installs,main = "Gráfico de barras : Installs", 
        xlab = "Installs", 
        ylab = "Frecuencia",
        col = "blue",
        ylim = c(0, 2000)
        )



