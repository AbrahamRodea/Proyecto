################### Este script es un campo de pruebas, no encontraras nada util aqui 
suma<-0

contador<-0

points<-0



for ( i in 1:length(datos1[,3])) {
    
       while(suma <= elije & suma < elije + 60){
        
           points<-as.numeric(datos1[i,3])
           
             suma<<- contador + points
             
               contador<- suma
               
                 
                 }
     print(paste("Tu suma es: ",suma))
     
       unidades<-c(unidades,i) ###########################
       
         print(paste("Tu lista tiene: ",length(unidades),"unidades"))
       
         listadeunidades<<-unidades
         
           lista_de_unidades1<-data.frame(
               
                 Nombre<-datos1[listadeunidades,1],
               
                 Numero_de_miniaturas<-datos1[listadeunidades,2],
               
                 Puntos<-datos1[listadeunidades,3],
               
                Tipo<-datos1[listadeunidades,4]
               
              )
         }
