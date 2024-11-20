####################################################################################################################################################################

# El siguiente script no cuenta con comentarios, esta pensado para usarse en un escenario real

# Si deseas ver el script con comentarios ve al script "Ejercito" disponible en la carpeta "Scripts" de este proyecto

####################################### Elije una faccion ####################################

#### Esta función debe permitir que el usuario elija una de las 4 facciones que se presentan en esta primera version del codigo

### En el oscuro milenio 40,000 solo hay ¡GUERRA!

ejercito<-function(x){ 
  
  faccion<<- as.numeric( readline( prompt = "Las facciones del juego son: Marines espaciales(1), Tau(2), Tiranidos(3) y Necrones(4), coloca el numero de tu faccion: \n ")) 
  
  if( faccion == 1 ){ 
    
    puntos<-read.csv( "Datos/Puntos de ejercito  - Marines espaciales.csv" ) 
    
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
    
  }  else {    
    
    print("Has seleccionado una facción no disponible")
    
    ejercito() 
    
  }
} 

ejercito() #Para ejecutar La función no es necesario colocar ningun valor


#####################################Elegir el tipo de partida ##########################################################################

### El siguiente codigo tiene como objetivo que el usuario elija el tipo de partida que desea jugar

### En esta version del codigo ofrecemos los tres modos de juego mas comunes de warhammer 40k


elije_tipo_de_partida<-function(y){ 
  
  modos_de_juego<-c("patrulla","escaramuza","estandar") 
  
  puntos_de_partida<-c( 500,1000,2000 ) 
  
  partidas_disponibles<-names( puntos_de_partida )<-modos_de_juego 
  
  print(paste("Los puntajes de partida disponibles son: ", puntos_de_partida )) 
  
  elije<<-as.numeric(readline("Elige el numero de puntos al que deseas jugar tu partida: ")) 
  
  if (!(elije %in% puntos_de_partida)){  
    
    print("Has seleccionado un puntaje no disponible") 
    
    elije_tipo_de_partida() 
    
  } else if ( elije == 500){ 
    
    print(paste("Has elgido el modo de juego de: ", modos_de_juego[[1]])) 
    
  } else if ( elije == 1000){
    
    print(paste("Has elgido el modo de juego de: ", modos_de_juego[[2]]))
    
  } else if ( elije == 2000){
    
    print(paste("Has elgido el modo de juego de: ", modos_de_juego[[3]]))
  }
}

elije_tipo_de_partida() #Para ejecutar La función no es necesario colocar ningun valor

############################################### Forma tu lista de ejercito #######################################################################################################

#La siguiente funcion permite al usuario formar una lista a elección

#Esta funcion usa los objetos "elije" y "faccion" asigandos en las dos funciones previas

# Esta funciion no se puede ejecutar si no se han ejecutado las dos funciones previas

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
  
  unidades<-c() 
  
  print(paste("Tienes", elije, "puntos disponibles")) 
  
  w<-as.numeric(readline("Coloca el numero de la unidad que deseas agregar a tu lista: ")) 
  
  while (suma <= elije) { 
    
    points<-as.numeric(datos1[[3]][[w]]) 
    
    suma<- suma + points 
    
    unidades<-c(unidades,w) 
    
    if (suma <= elije){ 
      
      print(paste("Tu numero de puntos hasta ahora es: ", suma)) 
      
      print(paste("Te quedan: ", elije + 60 - suma, "puntos")) 
      
      print(paste("Tu lista tiene: ",length(unidades),"unidades")) 
      
      print(subset(datos1, datos1[, 3] <= (elije+60-suma))) 
      
      w<-as.numeric(readline("Coloca el numero de la unidad que deseas agregar a tu lista: ")) 
      
      listadeunidades<<-unidades 
      
      lista_de_unidades1<-data.frame( 
        
        Nombre<-datos1[listadeunidades,1], 
        
        Numero_de_miniaturas<-datos1[listadeunidades,2], 
        
        Puntos<-datos1[listadeunidades,3], 
        
        Tipo<-datos1[listadeunidades,4]
        
      )
      
      
    } else if ( suma > elije + 60){
      
      print("Has sobrepasado el numero de puntos permitido en este modo de juego, no puedes usar esta lista") 
      
    } else if ( elije <= suma & suma <= elije + 60 ){ 
      
      print("Listo! A continuación se mostrará su lista de unidades")
      
      View(lista_de_unidades1) 
    }
    
  }
}

crea_tu_lista_de_ejercito() #Para ejecutar La función no es necesario colocar ningun valor

################################# Crea una lista aleatoria ###############################################################

# Esta función crea una lista aleatoria de unidades en funcion de un puntaje y faccion definidos

# Esta funcion seria util como un reto entre amigos, sin embargo, su utilidad es nula en partidas oficiales

#Esta lista asume que el usuario es millonario y tiene las miniaturas de todas las unidades de la faccion que eligio

crear_lista_de_ejercito_automatico<-function(p){ 
  
  if( faccion == 1){ 
    
    datos1<<-as.data.frame(read.csv("Datos/Puntos de ejercito  - Marines espaciales.csv"))
    
  } else if (faccion == 2 ){
    
    datos1<<-as.data.frame(read.csv("Datos/Puntos de ejercito  - Tau.csv"))
    
  }else if (faccion == 3 ){
    
    datos1<<-as.data.frame(read.csv("Datos/Puntos de ejercito  - Tiranido.csv"))
    
  } else if (faccion == 4 ){
    
    datos1<<-as.data.frame(read.csv("Datos/Puntos de ejercito  - Necron.csv"))
  }
  
  suma<-0
  
  contador<-0
  
  unidades<-c()
  
  datos_disponibles<- subset(datos1, datos1[, 3] <= (elije+60-suma)) 
  
  indices_disponibles <- as.numeric(rownames(datos_disponibles)) 
  
  w <- sample(indices_disponibles, 1) 
  
  while (suma <= elije) { 
    
    points<-as.numeric(datos1[[3]][[w]]) 
    suma<- suma + points 
    
    unidades<-c(unidades,w)
    
    listadeunidades<<-unidades
    
    lista_de_unidades1<-data.frame( 
      
      Nombre<-datos1[listadeunidades,1],
      
      Numero_de_miniaturas<-datos1[listadeunidades,2],
      
      Puntos<-datos1[listadeunidades,3],
      
      Tipo<-datos1[listadeunidades,4]
      
    )
    
    datos_disponibles<- subset(datos1, datos1[, 3] <= (elije+60-suma))
    
    indices_disponibles <- as.numeric(rownames(datos_disponibles))
    
    if (length(indices_disponibles)>0){ 
      
      w <- sample(indices_disponibles, 1) 
    }
    else {break}
    
  }
  
  print("Listo! A continuación se mostrará su lista de unidades") 
  
  View(lista_de_unidades1)
}

crear_lista_de_ejercito_automatico()#Para ejecutar La función no es necesario colocar ningun valor


