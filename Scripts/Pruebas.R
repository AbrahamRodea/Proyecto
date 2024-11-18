
ejercito<-function(x){
  
  faccion<<- as.numeric( readline( prompt = "Las facciones del juego son: Marines espaciales(1), Tau(2), Tiranidos(3) y Necrones(4), coloca el numero de tu faccion: \n "))           
  
  if( faccion == 1 ){
    
    puntos<-read.csv("Datos/Puntos de ejercito  - Marines espaciales.csv")
    
    print( "Has elegido a los angeles de la muerte del emperador")
    
    print( "Estas son las unidades disponibles: ")
    
    print(paste( puntos[[1]]))
    
  } else if ( faccion == 2 ){
    
    puntos<-read.csv("Datos/Puntos de ejercito  - Tau.csv")
    
    print( "Has elegido el bien mayor")
    
    print( "Estas son las unidades disponibles: ")
    
    print(paste( puntos[[1]]))
    
  } else if ( faccion == 3){
    
    puntos<-read.csv("Datos/Puntos de ejercito  - Tiranido.csv")
    
    print( "Hambreeeeeeeee")
    
    print( "Estas son las unidades disponibles: ")
    
    print(paste( puntos[[1]]))
    
  } else if ( faccion == 4){
    
    puntos<-read.csv("Datos/Puntos de ejercito  - Necron.csv")
    
    print( "¿Por qué dar un nombre a la totalidad?")
    
    print( "Estas son las unidades disponibles: ")
    
    print(paste( puntos[[1]]))
  } 
} 

ejercito() #Para ejecutar La función no es necesario colocar ningun valor


#####################################Elegir el tipo de partida ##########################################################################


elije_tipo_de_partida<-function(y){ 
  
  modos_de_juego<-c("patrulla","escaramuza","estandar") #Creamos un vector para los tipos de partida
  
  puntos_de_partida<-c(500,1000,2000) #Asiganmos el numero de puntos necesarios para cada partida
  
  partidas_disponibles<-names(puntos_de_partida)<-modos_de_juego
  
  print(paste("Los puntajes de partida disponibles son: ",puntos_de_partida))
  
  elije<<-as.numeric(readline("Elige el numero de puntos al que deseas jugar tu partida: ")) ### Colocar "<<-" para que la función asigne un valo al objeto a nivel global
  
  if ( elije != 500 & elije != 1000 & elije != 2000){
    
    print("Has seleccionado un puntaje no disponible")
    
  } else if ( elije == 500){
    
    print(paste("Has elgido el modo de juego de: ", modos_de_juego[[1]]))
    
  } else if ( elije == 1000){
    
    print(paste("Has elgido el modo de juego de: ", modos_de_juego[[2]]))
    
  } else if ( elije == 2000){
    
    print(paste("Has elgido el modo de juego de: ", modos_de_juego[[3]]))
  }
}

elije_tipo_de_partida()

############################################### Forma tu lista de ejercito #######################################################################################################


crea_tu_lista_de_ejercito<-function(p){
  
  if( faccion == 1){
    
    datos1<<-as.data.frame(read.csv("Datos/Puntos de ejercito  - Marines espaciales.csv"))
    
    
  } else if (faccion == 2 ){
    
    datos1<<-as.data.frame(read.csv("Datos/Puntos de ejercito  - Tau.csv"))
    
    
  }else if (faccion == 3 ){
    
    datos1<<-as.data.frame(read.csv("Datos/Puntos de ejercito  - Tiranido.csv"))
    
  } else if (faccion == 4 ){
    
    datos1<<-as.data.frame(read.csv("Datos/Puntos de ejercito  - Necron.csv"))
  }
  
  print(datos1)
  
  suma<-0
  
  contador<-0
  
  unidades<-c()
  
  w<-as.numeric(readline("Coloca el numero de la unidad que deseas agregar a tu lista: "))
  
  while ( suma <= elije & suma < elije + 60) {
    
    points<-as.numeric(datos1[[3]][[w]])
    
    suma<- contador + points
    
    contador<- suma
    
    print(paste("Tu numero de puntos es: ", suma))
    
    unidades<-c(unidades,w) ###########################
  
    print(paste("Tu lista tiene: ",length(unidades),"unidades"))
    
    listadeunidades<<-unidades
    
    if (suma < elije){
      
      w<-as.numeric(readline("Coloca el numero de la unidad que deseas agregar a tu lista: "))
      
    } else if ( suma > elije + 60){
      
      print("Has sobrepasado el numero de puntos permitido en este modo de juego, no puedes usar esta lista")
    }
  }
}

crea_tu_lista_de_ejercito() 

################################################################################################
suma<<-0

unidades<-c

w<-as.numeric(readline("Coloca el numero de la unidad que deseas agregar a tu lista: "))

while ( suma <= elije & suma < elije + 60) {
  
  points<-as.numeric(datos1[[3]][[w]])
  
  suma<-suma + points
  
  print(paste("Tu numero de puntos es: ", suma))
  
  unidades<-c(unidades,suma)
}
  
length(unidades)
