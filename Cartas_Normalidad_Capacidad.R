#   Paquetes para intalar  #
#   car                    #
#   imtest                 #
#   nortest                #
#   tseries                #
#__________________________#


library(readxl)
datos <- read_excel("E:/UDEA/20231/Calidad/Clase 10 Cartas Rango-Media_Normalidad_Capacidad/Cartas.xlsx", 
                    sheet = "Rango&Media", 
                    range = "B3:F27", 
                    col_names = FALSE)

require(qcc)                                                                    # cargar el paquete R "qcc" en la sesión actual de RStudio. 
                                                                                # El paquete "qcc" es una herramienta útil para el análisis estadístico de control de calidad
                                                                                # y se utiliza para crear gráficos de control

#______________________________________________________________________________#
#                  G R A F I C O   D E   C O N T R O L                         #
#                       R a n g o   &   M e d i a                              #

GraficoDesvacion = qcc(datos, 
                       type="R")        

GraficoMedias = qcc(datos, 
                    type="xbar")
#______________________________________________________________________________#




#______________________________________________________________________________#
#                 P R U E B A S   D E   N O R M A L I D A D
#

vector_numerico <- unlist(datos)                                                # Se convierte la matriz "datos" a vector numerico

    
shapiro.test(vector_numerico)                                                   # Prueba de Shapiro-Wilk
                                                                                # Si P < 0.05 (nivel de significancia puede variar)
                                                                                # Rechazo hipotesis nula de que los datos sigen una distribución normal
                                                                                # [En este caso]
                                                                                # No se puede rechazar la hipótesis nula de que los datos siguen una distribución normal.
                                                                                # hay suficiente evidencia estadística para decir que los datos son consistentes con una distribución normal.
                                                                                # Se puede asumir que los datos siguen una distribución normal y continuar con el análisis de control de calidad. 
    
library(nortest)                                                                # libreria
ad.test(vector_numerico)                                                        # Anderson-Darling
                                                                                # Si P < 0.05 (nivel de significancia puede variar)
                                                                                # Rechazo hipotesis nula de que los datos sigen una distribución normal
                                                                                # [En este caso]
                                                                                # No se puede rechazar la hipótesis nula de que los datos siguen una distribución normal.
                                                                                # hay suficiente evidencia estadística para decir que los datos son consistentes con una distribución normal.
    
    
   
friedman.test(vector_numerico)                                                  # Homogeneidad de Cochran
                                                                                # Si P < 0.05 (nivel de significancia puede variar)
                                                                                # Rechazo hipotesis nula de que los datos sigen una distribución normal
                                                                                # [En este caso]
                                                                                # No se puede rechazar la hipótesis nula de que los datos siguen una distribución normal.
                                                                                # hay suficiente evidencia estadística para decir que los datos son consistentes con una distribución normal.


  
#______________________________________________________________________________#
#                 C A P A C I D A D   D E L   P R O C E S O
#
#
library(qcc)

# Generar datos de ejemplo
datos <- rnorm(100, 5, 1)

# Calcular el índice de capacidad Cp y Cpk
cpk(datos, lsl = 3, usl = 7)
