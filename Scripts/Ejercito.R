##### Crear una lista de ejercito #####

modos_de_juego<-c("patrulla","Escaramuza","Estandar") #Creamos un vector para los tipos de partida

puntos_de_partida<-c(500,1000,2000) #Asiganmos el numero de puntos necesarios para cada partida

names(puntos_de_partida)<-modos_de_juego

ejercito<-function(x){
  
  x<- as.numeric( readline( prompt = "Las facciones del juego son: Marines espaciales(1), Tau(2), Tiranidos(3) y Necrones(4), coloca el numero de tu faccion: "))           
  
  if( x == 1 ){
    puntos<-read.csv("Datos/Puntos de ejercito  - Marines espaciales.csv")
    print( "Has elegido a los angeles de la muerte del emperador")
    print( "Estas son las unidades disponibles: ")
    print(paste( puntos[[1]]))
    
  } else if ( x == 2 ){
    puntos<-read.csv("Datos/Puntos de ejercito  - Tau.csv")
    print( "Has elegido el bien mayor")
    print( "Estas son las unidades disponibles: ")
    print(paste( puntos[[1]]))
    
  } else if ( x == 4){
    puntos<-read.csv("Datos/Puntos de ejercito  - Necron.csv")
    print( "¿Por qué dar un nombre a la totalidad?")
    print( "Estas son las unidades disponibles: ")
    print(paste( puntos[[1]]))
  } 
}
 

