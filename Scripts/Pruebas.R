datos1<-as.data.frame(read.csv("Datos/Puntos de ejercito  - Marines espaciales.csv"))
datos1

elije<-500
suma<-0
w<-as.numeric(readline("Coloca el numero de la unidad que deseas agregar a tu lista: "))
suma_de_puntos<- while ( suma <= elije) {
  points<-as.numeric(datos1[[3]][[w]])
  suma<-suma + points
  print(suma)
  
  if (suma < elije){
    w<-as.numeric(readline("Coloca el numero de la unidad que deseas agregar a tu lista: "))
  }
}

elije<-as.numeric(readline("Elige el numero de puntos al que deseas jugar tu partida: "))

