################################################################################################################################

#Esta es la version del script con comentarios, si deseas visualizar el codigonsin comentarios ve al scipt "Codigo final" que encontraras en la carpeta "scripts de este proyecto

####################################### Elije una faccion ####################################

#### Esta función debe permitir que el usuario elija una de las 4 facciones que se presentan en esta primera version del codigo

###En esceneraios futuros será sencillo incorporar bases de datos de facciones nuevas pues el codigo se adapta independientemente de la base de datos

###Las nuevas bases de datos deben respetar la estructura presente en estas tres bases de datos

ejercito<-function(x){ #La funcion 
  
  faccion<<- as.numeric( readline( prompt = "Las facciones del juego son: Marines espaciales(1), Tau(2), Tiranidos(3) y Necrones(4), coloca el numero de tu faccion: \n ")) # Esta linea permite al usuario elegir una faccion de acuerdo al numero que se le asigno a dicha faccion           
  
  #La linea anterior tiene un "<<-" esto es debido a que queremos que el objeto "faccion" se asigne en el ambiente global, pues, sera necesario en las siguientes funciones
  
  if( faccion == 1 ){ #Las siguientes lineas de "if" y "else if" definen cual será la base de datos que usarán las funciones
    
    puntos<-read.csv("Datos/Puntos de ejercito  - Marines espaciales.csv") # La base de datos se define en funcion de la eleccion de faccion del usuario
    
    print( "Has elegido a los angeles de la muerte del emperador") #Cada faccion tiene un mensaje personalizado
    
    print( "Estas son las unidades disponibles: ") # Imprimimos un mensaje que le informe al usuario que a continuación se muestran las unidades disponibles para su faccion
    
    print(paste( puntos[[1]])) # Imprimimos las unidades de la faccion del usuario 
    
  } else if ( faccion == 2 ){ # Se repite lo anterior 
    
    puntos<-read.csv("Datos/Puntos de ejercito  - Tau.csv")
    
    print( "Has elegido el bien mayor")
    
    print( "Estas son las unidades disponibles: ")
    
    print(paste( puntos[[1]]))
    
  } else if ( faccion == 3){ # Se repite lo anterior
    
    puntos<-read.csv("Datos/Puntos de ejercito  - Tiranido.csv")
    
    print( "Hambreeeeeeeee")
    
    print( "Estas son las unidades disponibles: ")
    
    print(paste( puntos[[1]]))
    
  } else if ( faccion == 4){ # Se repite lo anterior
    
    puntos<-read.csv("Datos/Puntos de ejercito  - Necron.csv")
    
    print( "¿Por qué dar un nombre a la totalidad?")
    
    print( "Estas son las unidades disponibles: ")
    
    print(paste( puntos[[1]]))
 
     }  else {    ### En caso de que el usuario coloque un valor invalido le informamos que dicho valor no es valido 
    
       # Esta linea se descubrio por error 
       
    print("Has seleccionado una facción no disponible")
    
    ejercito() # Volvemos a colocar la función para que coloque un valor de faccion valido
    
  }
} 

ejercito() #Para ejecutar La función no es necesario colocar ningun valor


#####################################Elegir el tipo de partida ##########################################################################

### El siguiente codigo tiene como objetivo que el usuario elija el tipo de partida que desea jugar

### En esta version del codigo ofrecemos los tres modos de juego mas comunes de warhammer 40k


elije_tipo_de_partida<-function(y){ # Nombramos la funcion 
  
  modos_de_juego<-c("patrulla","escaramuza","estandar") #Creamos un vector con los nombres de los tipos de partida
  
  puntos_de_partida<-c(500,1000,2000) #Asiganmos el numero de puntos necesarios para cada tipo partida
  
  partidas_disponibles<-names(puntos_de_partida)<-modos_de_juego # Asignamos los puntos correspondientes a cada tipo de partida
  
  print(paste("Los puntajes de partida disponibles son: ",puntos_de_partida)) # Informamos al usuario los puntajes de partida disponibles, usamos puntajes y no el tipo de partida ya que es más sencillo recordar y un valor de tipo numerico es mas util para funciones posteriores
  
  elije<<-as.numeric(readline("Elige el numero de puntos al que deseas jugar tu partida: ")) 
  
  #La linea anterior tiene un "<<-" esto es debido a que queremos que el objeto "elije" se asigne en el ambiente global, pues, sera necesario en las siguientes funciones
  
  if (!(elije %in% puntos_de_partida)){  # Si el valor colocado por el usuario es distinto a las opciones disponibles le informamos que dicho puntaje no esta disponible, le arrojamos la función de nuevo para que introduzca un valor valido.
    
    print("Has seleccionado un puntaje no disponible") # Imprimimos esto para que el usuario este enterado que su seleccion no esta permitida
    
    elije_tipo_de_partida() # Arrojamos nuevamente la funcion para que coloque un valor valido
    
  } else if ( elije == 500){ # Si el valor ingresado es valido se ejecutara alguna de las siguientes lineas en funcion del puntaje elejido por el usuario
    
    print(paste("Has elgido el modo de juego de: ", modos_de_juego[[1]])) # Imprimimos el modo de juego correspondiente a cada puntaje, de esta forma el usuario sabe que modo esta jugando
    
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

crea_tu_lista_de_ejercito<-function(p){ # Nombramos la funcion 
  
  #Las siguientes condiciones definen que base de datos se usara en funcion de la facion elegida por el usuario
  
  if( faccion == 1){ # Aqui es indispensable que "facion" se haya asignado previamente
    
    datos1<<-as.data.frame(read.csv("Datos/Puntos de ejercito  - Marines espaciales.csv")) #Las bases de datos se leen como datafames 
    
  } else if (faccion == 2 ){
    
    datos1<<-as.data.frame(read.csv("Datos/Puntos de ejercito  - Tau.csv"))
    
  }else if (faccion == 3 ){
    
    datos1<<-as.data.frame(read.csv("Datos/Puntos de ejercito  - Tiranido.csv"))
    
  } else if (faccion == 4 ){
    
    datos1<<-as.data.frame(read.csv("Datos/Puntos de ejercito  - Necron.csv"))
  }
  
  print(datos1) # Imprimimos la base de datos para que el usuario conozca sus unidades y el puntaje de las mismas 
  
  #Asiganamos el valor de los siguientes objetos que seran usados dentro de un ciclo while, todos se asignan con un valor inicial de 0
  
  suma<-0 
  
  unidades<-c() # Este vector es indispensable para imprimir la lista del usuario
  
  print(paste("Tienes", elije, "puntos disponibles")) # Hacemos del conocimiento del usuario la cantidad de puntos con los que dispone, la cantidad de puntos varia en funcion de su eleccion del tipo de partida
  
  w<-as.numeric(readline("Coloca el numero de la unidad que deseas agregar a tu lista: ")) # El usuario debe colocar el numero de la unidad que desea implementar en su lista
  
  while (suma <= elije) { # La condicion para que el usuario pueda incluir nuevas unidades a su lista es que la suma de puntos de estas no sobrepase el puntaje del tipo de partida elejida por el usuario 
    
    points<-as.numeric(datos1[[3]][[w]]) # Esta linea extrae el puntaje de la unidad elejida por el usuario, la columna es "3" debido a que esta columna contiene los puntos de las unidades, este valor es el que usaremos en la suma, los renglones estan definidos por w que es numero de la unidad elegida por el usuario
    
    suma<- suma + points # Asigamos al objeto "suma" la suma de los puntos de cada una de las unidades elegidas por el usuario, por ello asignamos a "suma" el valor de 0 previamente 
    
    unidades<-c(unidades,w) #Este vector almacena cada una de las iteraciones del ciclo while, es decir, cada una de las posiciones elegidas por el usuario. Almacena las iteraciones ya que el vector se contiene a si mismo, esto le permite almacenar cada valor de "W" que es el definido por el usuario 
    
    if (suma <= elije){ # La siguiente condicion tiene como objetivo informar al usuario el estado de su lista
      
      print(paste("Tu numero de puntos hasta ahora es: ", suma)) # Informa cuantos puntos ha sumado hasta ese momento en su lista
      
      print(paste("Te quedan: ", elije + 60 - suma, "puntos")) # Informa la cantidad de puntos que le quedan disponibles
      
      print(paste("Tu lista tiene: ",length(unidades),"unidades")) # Informa el numero de unidades que contiene su lista, basicamente, el numero de iteraciones del while
      
      print(subset(datos1, datos1[, 3] <= (elije+60-suma))) # Esta linea imrpime al usuario todas las unidades de su faccion que puede incorporar a su lista sin sobrepasar el puntaje de su tipo de juego
      
      w<-as.numeric(readline("Coloca el numero de la unidad que deseas agregar a tu lista: ")) # Si la suma es menor al puntaje maximo de la partida el usuario puede seguir sumando unidades
      
      listadeunidades<<-unidades # Asigamos el vector que contiene las iteraciones a un nuevo objeto
      
      lista_de_unidades1<-data.frame( # Creamos un data frame que nos permitira imprimir la lista de ejercito selecionada por el usuario
        
        Nombre<-datos1[listadeunidades,1], # El data frame contiene un objeto para cada una de las columnas, la columna se encuentra definida con el numero de la misma
        
        Numero_de_miniaturas<-datos1[listadeunidades,2], # El renglon se define en funcion de los numeros de las unidades elegidas por el usuario al realizar su lista
        
        Puntos<-datos1[listadeunidades,3], # Por ello el renglon lo define el objeto "listadeunidades" que contiene las posiciones de las unidades en la base de datos
        
        Tipo<-datos1[listadeunidades,4]
        
      )
      
      
    } else if ( suma > elije + 60){
      
      print("Has sobrepasado el numero de puntos permitido en este modo de juego, no puedes usar esta lista") # Si la suma sobrepasa el puntaje del modo de juego en mas de 60 unidades, entonces informamos al usuario que dicha suma no es valida
      
      # Si el usuario sigue la lista de unidades que se imprime en cada iteracion entonces jamas tendra este problema 
      
    } else if ( elije <= suma & suma <= elije + 60 ){ # Si la lista cumple con el puntaje permitido se imprime lo siguiente
      
      print("Listo! A continuación se mostrará su lista de unidades")# Mensaje informando que la lista cumple con los parametros
      
      View(lista_de_unidades1) #Arrojamos la lista para que el usuario la observe 
      
    }
    
  }
}

crea_tu_lista_de_ejercito() #Para ejecutar La función no es necesario colocar ningun valor

################################# Crea una lista aleatoria ###############################################################

# Esta función crea una lista aleatoria de unidades en funcion de un puntaje y faccion definidos

# Esta funcion seria util como un reto entre amigos, sin embargo, su utilidad es nula en partidas oficiales

#Esta lista asume que el usuario es millonario y tiene las miniaturas de todas las unidades de la faccion que eligio

crear_lista_de_ejercito_automatico<-function(p){ # Nombramos la funcion 
  
  #Las siguientes condiciones definen que base de datos se usara en funcion de la facion elegida por el usuario
  
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
  
  datos_disponibles<- subset(datos1, datos1[, 3] <= (elije+60-suma)) # Asignamos un subset de datos que contiene datos de la columna 3 (columna de puntaje), esta linea es similar a la de la tercera funcion, a medida que aumenta el valor de la suma, disminuyen los datos disponibles
  
  indices_disponibles <- as.numeric(rownames(datos_disponibles)) # Un objeto que almacena la posicion de los datos usados para alcanzar el valor maximo de "suma"
  
  w <- sample(indices_disponibles, 1) # Toma un numero de fila al azar de los datos disponibles, usamos 1 porque solo queremos que tome un renglon a la vez 
  
  while (suma <= elije) { # Establecemos la condicion bajo la cual se puede ejecutar el codigo
    
    points<-as.numeric(datos1[[3]][[w]]) # Esta vez "w" no esta definida por el usuario sino que es aleatoria
    
    # Las siguientes lineas son identicas a la funcion anterior
    
    suma<- suma + points 
    
    unidades<-c(unidades,w)
    
    listadeunidades<<-unidades
    
    lista_de_unidades1<-data.frame( # Creamos data frame
      
      Nombre<-datos1[listadeunidades,1],
      
      Numero_de_miniaturas<-datos1[listadeunidades,2],
      
      Puntos<-datos1[listadeunidades,3],
      
      Tipo<-datos1[listadeunidades,4]
      
    )
    
    datos_disponibles<- subset(datos1, datos1[, 3] <= (elije+60-suma))
    
    indices_disponibles <- as.numeric(rownames(datos_disponibles))
    
    if (length(indices_disponibles)>0){ # Si aun hay objetos por sumar (aun no se alcanza el valor máximo de suma), entonces se sigue tomando un renglon al azar 
      
      w <- sample(indices_disponibles, 1) # En lugar de copiar el renglon pasado solo usamos el objeto "indices_disponibles"
    }
    else {break}
    
  }
  
  print("Listo! A continuación se mostrará su lista de unidades") # Le informamos al usuario que su lista esta lista
  
  View(lista_de_unidades1)# Imprimimos su lista
}

crear_lista_de_ejercito_automatico()
