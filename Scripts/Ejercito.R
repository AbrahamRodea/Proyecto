##### Elije una faccion #####

ejercito<-function(x){
  
  x<- as.numeric( readline( prompt = "Las facciones del juego son: Marines espaciales(1), Tau(2), Tiranidos(3) y Necrones(4), coloca el numero de tu faccion: \n "))           
  
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
    
  } else if ( x == 3){
    puntos<-read.csv("Datos/Puntos de ejercito  - Tiranido.csv")
    print( "Hambreeeeeeeee")
    print( "Estas son las unidades disponibles: ")
    print(paste( puntos[[1]]))
    
  } else if ( x == 4){
    puntos<-read.csv("Datos/Puntos de ejercito  - Necron.csv")
    print( "¿Por qué dar un nombre a la totalidad?")
    print( "Estas son las unidades disponibles: ")
    print(paste( puntos[[1]]))
  } 
} 

ejercito() #Para ejecutar La función no es necesario colocar ningun valor


### Elegir el tipo de partida ###


elije_tipo_de_partida<-function(y){ 

modos_de_juego<-c("patrulla","Escaramuza","Estandar") #Creamos un vector para los tipos de partida

puntos_de_partida<-c(500,1000,2000) #Asiganmos el numero de puntos necesarios para cada partida

partidas_disponibles<-names(puntos_de_partida)<-modos_de_juego

print(paste("Los puntajes de partida disponibles son: ",puntos_de_partida))

elije<-as.numeric(readline("Elige el numero de puntos al que deseas jugar tu partida: "))

if ( elije != 500 & elije != 1000 & elije != 2000){
  print("Has seleccionado un puntaje no disponible")

} else if ( elije == 500){
  print(paste("Has elejido: ", modos_de_juego[[1]]))

} else if ( elije == 1000){
  print(paste("Has elejido: ", modos_de_juego[[2]]))

} else if ( elije == 2000){
  print(paste("Has elejido: ", modos_de_juego[[3]]))
}
}

elije_tipo_de_partida() #Para ejecutar La función no es necesario colocar ningun valor

### Forma tu lista de ejercito ###







