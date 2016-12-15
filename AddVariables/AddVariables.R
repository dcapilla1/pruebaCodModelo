AddVariables<-function(distribuidora){

  #Aumentamos la memoria de R
  
  memory.limit(48582)
  
  rutaCapaRural <- "NucleosProblacion_WGS84"
  
  capaMunicipios <- "pol_mun_WGS84"
  
  cuadricula <- "cuadricula"
  
  df_fichSum123 <- df_fichSum123[names(df_fichSum123) %in% c("cs_id_pm", "sce_id_cups13")]
  
  df_fichSum123 <- UnirTablas(df_fichTramoSolape, df_fichSum123,"id", "cs_id_pm", "RJ" )
  
  if (distribuidora == "GZA"){
  
      #Fichero de coordenadas GZA
    
    ficheroCoordGZA <- "Datos/GZA/T1UTMFI_GZA_GIGA.txt"
    
    #Fichero de suministros GZA
    
    ficheroSumEndesaGZA <- "Datos/GZA/SUMIN_MIN_GZA_GIGA_MOD_R.txt"
    
    df_fichSumGZA<-LeerTXT(ficheroSumEndesaGZA, '|')
    
    
    df_fichCoordGZA<-LeerTXT(ficheroCoordGZA, '|')
    
    #Cálculo de variables de GZA
    
    df_fichSum123_GZA <- UnirTablas(df_fichSum123, df_fichSumGZA, "sce_id_cups13", "CCOUNIPS", "J")
    
    df_fichSum123_GZA_Coord<-UnirTablas (df_fichSum123_GZA, df_fichCoordGZA, "DISTRIBUIDORA|CFINCA", "DISTRIBUIDORA|CFINCA", "RJ")
    
    
    
    df_fichSum123_GZA_Coord<-LongLatToUTM(df_fichSum123_GZA_Coord)
    
    df_fichEntregaGZA <- data.frame(df_fichSum123_GZA_Coord$cs_id_pm, df_fichSum123_GZA_Coord$sce_id_cups13, df_fichSum123_GZA_Coord$tramo, df_fichSum123_GZA_Coord$fecini, df_fichSum123_GZA_Coord$fecfin, df_fichSum123_GZA_Coord$VUTMX, df_fichSum123_GZA_Coord$VUTMY, df_fichSum123_GZA_Coord$VUTMZ, df_fichSum123_GZA_Coord$FCAPTURA, df_fichSum123_GZA_Coord$LONG, df_fichSum123_GZA_Coord$LAT)
    
    names(df_fichEntregaGZA)<-gsub(pattern = '.*\\.', '', names(df_fichEntregaGZA))
    
    capaPoligonal <- "polInd_GZA_WGS84"
    
    df_fichEntrega  <- df_fichEntregaGZA
    
    numFilas <- 318
    
    rm(df_fichEntregaGZA)
    rm(df_fichSum123_GZA)
    rm(df_fichCoordGZA)
    rm(df_fichSumGZA)
    rm(df_fichSum123_GZA_Coord)
    
    gc()
    
    
  }
  
  if (distribuidora == "CZZ"){
  
    #Fichero de coordenadas CZZ
    
    ficheroCoordCZZ <- "Datos/CZZ/T1UTMFI_CZZ_GIGA.txt"
    
    #Fichero de suministros CZZ
    
    ficheroSumEndesaCZZ <- "Datos/CZZ/Mod/SUMIN_MIN_CZZ_GIGA_MOD_R7.txt"
    
    df_fichCoordCZZ<-LeerTXT(ficheroCoordCZZ, '|')
    
    
    
    df_fichSumCZZ<-LeerTXT(ficheroSumEndesaCZZ, '|')
    
    
    
    #Cálculo de variables de CZZ
    
    df_fichSum123_CZZ <- UnirTablas(df_fichSum123, df_fichSumCZZ, "sce_id_cups13", "CCOUNIPS", "J")
    
    df_fichSum123_CZZ_Coord<-UnirTablas (df_fichSum123_CZZ, df_fichCoordCZZ, "DISTRIBUIDORA|CFINCA", "DISTRIBUIDORA|CFINCA", "RJ")
    
    df_fichSum123_CZZ_Coord<-LongLatToUTM(df_fichSum123_CZZ_Coord)
    
    df_fichEntregaCZZ <- data.frame(df_fichSum123_CZZ_Coord$cs_id_pm, df_fichSum123_CZZ_Coord$sce_id_cups13,  df_fichSum123_CZZ_Coord$tramo,  df_fichSum123_CZZ_Coord$fecini,  df_fichSum123_CZZ_Coord$fecfin, df_fichSum123_CZZ_Coord$VUTMX, df_fichSum123_CZZ_Coord$VUTMY, df_fichSum123_CZZ_Coord$VUTMZ, df_fichSum123_CZZ_Coord$FCAPTURA, df_fichSum123_CZZ_Coord$LONG, df_fichSum123_CZZ_Coord$LAT)
    
    
    
    names(df_fichEntregaCZZ)<-gsub(pattern = '.*\\.', '', names(df_fichEntregaCZZ))
    
    capaPoligonal <- "polInd_CZZ_WGS84"
    df_fichEntrega <- df_fichEntregaCZZ 
    numFilas <- 318
    rm(df_fichEntregaCZZ)
    rm(df_fichSum123_CZZ)
    rm(df_fichCoordCZZ)
    rm(df_fichSumCZZ)
    rm(df_fichSum123_CZZ_Coord)
    gc()
  }
  
  if (distribuidora == "SZZ"){
    
    
    
    #Fichero de coordenadas SZZ
    
    ficheroCoordSZZ <- "Datos/SZZ/T1UTMFI_SZZ_GIGA.txt"
    
    #Fichero de suministros SZZ
    
    ficheroSumEndesaSZZ <- "Datos/SZZ/SUMIN_MIN_SZZ_GIGA_MOD_R.txt"
    
    df_fichCoordSZZ<-LeerTXT(ficheroCoordSZZ, '|')
    
    
    
    df_fichSumSZZ<-LeerTXT(ficheroSumEndesaSZZ, '|')
    
    
    
    df_fichSum123_SZZ <- UnirTablas(df_fichSum123, df_fichSumSZZ, "sce_id_cups13", "CCOUNIPS", "J")
    
    
    #Fichero de coordenadas SZZ
    
    df_fichSum123_SZZ_Coord<-UnirTablas (df_fichSum123_SZZ, df_fichCoordSZZ, "DISTRIBUIDORA|CFINCA", "DISTRIBUIDORA|CFINCA", "RJ")
    
    df_fichSum123_SZZ_Coord<-LongLatToUTM(df_fichSum123_SZZ_Coord)
    
    df_fichEntregaSZZ <- data.frame(df_fichSum123_SZZ_Coord$cs_id_pm, df_fichSum123_SZZ_Coord$sce_id_cups13, df_fichSum123_SZZ_Coord$tramo,  df_fichSum123_SZZ_Coord$fecini,  df_fichSum123_SZZ_Coord$fecfin, df_fichSum123_SZZ_Coord$VUTMX, df_fichSum123_SZZ_Coord$VUTMY,df_fichSum123_SZZ_Coord$VUTMZ, df_fichSum123_SZZ_Coord$FCAPTURA, df_fichSum123_SZZ_Coord$LONG, df_fichSum123_SZZ_Coord$LAT)
    
    names(df_fichEntregaSZZ)<-gsub(pattern = '.*\\.', '', names(df_fichEntregaSZZ))
    
    ###### Comprobar Poligono Industrial ########
    
    capaPoligonal <- "polInd_SZZ_WGS84"
    numFilas  <- 590
    
    
    df_fichEntrega <- df_fichEntregaSZZ
    
    rm(df_fichEntregaSZZ)
    rm(df_fichSum123_SZZ)
    rm(df_fichCoordSZZ)
    rm(df_fichSumSZZ)
    rm(df_fichSum123_SZZ_Coord)
    gc()
    
  }
  
  if (distribuidora == "UZZ"){
  
    #Fichero de coordenadas UZZ
    
    ficheroCoordUZZ <- "Datos/UZZ/T1UTMFI_UZZ_GIGA.txt"
    
    #Fichero de suministros UZZ
    
    ficheroSumEndesaUZZ <- "Datos/UZZ/SUMIN_MIN_UZZ_GIGA_MOD_R.txt"
    
    df_fichCoordUZZ<-LeerTXT(ficheroCoordUZZ, '|')
    
    
    df_fichSumUZZ<-LeerTXT(ficheroSumEndesaUZZ, '|')
    
    
        #Cálculo de variables de UZZ
    
    df_fichSum123_UZZ <- UnirTablas(df_fichSum123, df_fichSumUZZ, "sce_id_cups13", "CCOUNIPS", "J")
    
    df_fichSum123_UZZ_Coord<-UnirTablas (df_fichSum123_UZZ, df_fichCoordUZZ, "DISTRIBUIDORA|CFINCA", "DISTRIBUIDORA|CFINCA", "RJ")
    
    df_fichSum123_UZZ_Coord<-LongLatToUTM(df_fichSum123_UZZ_Coord)
    
    df_fichEntregaUZZ <- data.frame(df_fichSum123_UZZ_Coord$cs_id_pm, df_fichSum123_UZZ_Coord$sce_id_cups13, df_fichSum123_UZZ_Coord$tramo,  df_fichSum123_UZZ_Coord$fecini,  df_fichSum123_UZZ_Coord$fecfin, df_fichSum123_UZZ_Coord$VUTMX, df_fichSum123_UZZ_Coord$VUTMY, df_fichSum123_UZZ_Coord$VUTMZ, df_fichSum123_UZZ_Coord$FCAPTURA, df_fichSum123_UZZ_Coord$LONG, df_fichSum123_UZZ_Coord$LAT)
    
    names(df_fichEntregaUZZ)<-gsub(pattern = '.*\\.', '', names(df_fichEntregaUZZ))
    
    capaPoligonal <- "polInd_UZZ_WGS84"
    numFilas <- 483
    df_fichEntrega<- df_fichEntregaUZZ
    rm(df_fichEntregaUZZ)
    rm(df_fichSum123_UZZ)
    rm(df_fichCoordUZZ)
    rm(df_fichSumUZZ)
    rm(df_fichSum123_UZZ_Coord)
    gc()
    
  }
  
  if (distribuidora == "JZZ"){
    
    #Fichero de coordenadas JZZ
    
    ficheroCoordJZZ <- "Datos/JZZ/T1UTMFI_JZZ_GIGA.txt"
    
    #Fichero de suministros JZZ
    
    ficheroSumEndesaJZZ <- "Datos/JZZ/SUMIN_MIN_JZZ_GIGA_MOD_R.txt"
    
    df_fichCoordJZZ<-LeerTXT(ficheroCoordJZZ, '|')
    
    df_fichSumJZZ<-LeerTXT(ficheroSumEndesaJZZ, '|')
    
    
    #Cálculo de variables de JZZ
    
    df_fichSum123_JZZ <- UnirTablas(df_fichSum123, df_fichSumJZZ, "sce_id_cups13", "CCOUNIPS", "J")
    
    df_fichSum123_JZZ_Coord<-UnirTablas (df_fichSum123_JZZ, df_fichCoordJZZ, "DISTRIBUIDORA|CFINCA", "DISTRIBUIDORA|CFINCA", "RJ")
    
    df_fichSum123_JZZ_Coord<-LongLatToUTM(df_fichSum123_JZZ_Coord)
    
    df_fichEntregaJZZ <- data.frame(df_fichSum123_JZZ_Coord$cs_id_pm, df_fichSum123_JZZ_Coord$sce_id_cups13, df_fichSum123_JZZ_Coord$tramo,  df_fichSum123_JZZ_Coord$fecini,  df_fichSum123_JZZ_Coord$fecfin, df_fichSum123_JZZ_Coord$VUTMX, df_fichSum123_JZZ_Coord$VUTMY, df_fichSum123_JZZ_Coord$VUTMZ, df_fichSum123_JZZ_Coord$FCAPTURA, df_fichSum123_JZZ_Coord$LONG, df_fichSum123_JZZ_Coord$LAT)
    
    
    names(df_fichEntregaJZZ)<-gsub(pattern = '.*\\.', '', names(df_fichEntregaJZZ))
    
    capaPoligonal <- "polInd_JZZ_WGS84"
    numFilas <- 433
    df_fichEntrega <- df_fichEntregaJZZ 
    rm(df_fichEntregaJZZ)
    rm(df_fichSum123_JZZ)
    rm(df_fichCoordJZZ)
    rm(df_fichSumJZZ)
    rm(df_fichSum123_JZZ_Coord)
    gc()
    
  }
  
  df_Sum123 <- CompPolInd (df_fichEntrega, distribuidora, capaPoligonal)
  
  df_Sum123 <- unique(as.data.frame(df_Sum123))
  
  df_Sum123 <- CompMunicipio (df_Sum123, capaMunicipios)
  
  df_Sum123 <- DistCentro(df_Sum123)
  
  t0 <- Sys.time()
  df_Sum123 <- CalcularTasas(df_Sum123)
  t1 <- t0 - Sys.time()
  
  #df_Sum123 <- CalcularCP(df_Sum123, distribuidora)
  
  # Distancia a la costa
  df_Sum123 <- DistMasCercana(df_Sum123, distribuidora)
  
  #Distancia al punto de fraude más cercano
  df_Sum123 <- DistPunto(df_Sum123)
  
  df_Sum123 <- CompRural (df_Sum123, rutaCapaRural)
  
  gc()
  
  
  return (df_Sum123)  
}

CalcularCP <- function(df_Sum123, distribuidora){
  
  df_Sum123 <- SuministrosCP(df_Sum123, distribuidora, "CODIGO_POSTAL_WGS84", "A")
  
  df_Sum123 <- SuministrosCP(df_Sum123, distribuidora, "CODIGO_POSTAL_WGS84", "F")
  
  df_Sum123 <- SuministrosCP(df_Sum123, distribuidora, "CODIGO_POSTAL_WGS84", "I")
  
  df_Sum123 <- SuministrosCP(df_Sum123, distribuidora, "CODIGO_POSTAL_WGS84", "VF")
  
  df_Sum123[is.na(df_Sum123$FraudeCP),'FraudeCP'] <- 0
  
  df_Sum123[is.na(df_Sum123$AnormCP),'AnormCP'] <- 0
  
  df_Sum123[is.na(df_Sum123$InspCP),'InspCP'] <- 0
  
  df_Sum123[is.na(df_Sum123$VfCP),'VfCP'] <- 0
  
  return (df_Sum123)
  
}

CalcularTasas <- function (df_Sum123){
  
  df_Sum123 <- preCapaTasa(distribuidora, numFilas, df_Sum123)
  df_Sum123 <- ComprobarTasaFecha(distribuidora, df_Sum123)
  df_Sum123 <- NumInspecciones(df_Sum123)
  
  return (df_Sum123)
  
  
}
CalcularTasas_OLD<-function(df_Sum123){
  
  ###### Comprobar Suministro R = 1KM ########
  
  system.time(df_Sum123 <- ComprobarTasa("S", df_Sum123, 0.01))
  
  ###### Comprobar Suministro R = 2KM ########
  
  system.time(df_Sum123 <- ComprobarTasa("S", df_Sum123, 0.02))
  
  ###### Comprobar Suministro R = 5KM ########
  
  df_Sum123 <- ComprobarTasa("S", df_Sum123, 0.05)
  
  ###### Comprobar Suministro R = 10KM ########
  
    df_Sum123 <- ComprobarTasa("S", df_Sum123, 0.1)
  
  
  #  df_Sum123 <-ComprobarTasaFecha(df_Sum123, 0.01)
   # df_Sum123 <-ComprobarTasaFecha(df_Sum123, 0.02)
    #df_Sum123 <-ComprobarTasaFecha(df_Sum123, 0.05)
    #df_Sum123 <-ComprobarTasaFecha(df_Sum123, 0.1)
    
  ###### Comprobar Anormalidad R = 1KM ########
  
  df_Sum123 <- ComprobarTasa("A", df_Sum123, 0.01)
  
  ###### Comprobar Anormalidad R = 2KM ########
  
  df_Sum123 <- ComprobarTasa("A", df_Sum123, 0.02)
  
  ###### Comprobar Anormalidad R = 5KM ########
  
  df_Sum123 <- ComprobarTasa("A", df_Sum123, 0.05)
  
  ###### Comprobar Anormalidad R = 10KM ########
  
  df_Sum123 <- ComprobarTasa("A", df_Sum123, 0.1)
  
  ###### Comprobar Fraude R = 1KM ########
  
  df_Sum123 <- ComprobarTasa("F", df_Sum123, 0.01)
  
  ###### Comprobar Fraude R = 2KM ########
  
  df_Sum123 <- ComprobarTasa("F", df_Sum123, 0.02)
  
  ###### Comprobar Fraude R = 5KM ########
  
  df_Sum123 <- ComprobarTasa("F", df_Sum123, 0.05)
  
  ###### Comprobar Fraude R = 10KM ########
  
  df_Sum123 <- ComprobarTasa("F", df_Sum123, 0.1)
  
  ###### Comprobar Visita Fallida R = 1KM ########
  
  df_Sum123 <- ComprobarTasa("VF", df_Sum123, 0.01)
  
  ###### Comprobar Visita Fallida R = 2KM ########
  
  df_Sum123 <- ComprobarTasa("VF", df_Sum123, 0.02)
  
  ###### Comprobar Visita Fallida R = 5KM ########
  
  df_Sum123 <- ComprobarTasa("VF", df_Sum123, 0.05)
  
  ###### Comprobar Visita Fallida R = 10KM ########
  
  df_Sum123 <- ComprobarTasa("VF", df_Sum123, 0.1)
  
  ###### Comprobar Inspeccion R = 1KM ########
  
  df_Sum123 <- ComprobarTasa("I", df_Sum123, 0.01)
  
  ###### Comprobar Inspeccion R = 2KM ########
  
  df_Sum123 <- ComprobarTasa("I", df_Sum123, 0.02)
  
  ###### Comprobar Inspeccion R = 5KM ########
  
  df_Sum123 <- ComprobarTasa("I", df_Sum123, 0.05)
  
  ###### Comprobar Inspeccion R = 10KM ########
  
  df_Sum123 <- ComprobarTasa("I", df_Sum123, 0.1)
  
  ###### Número de inspecciones #########
  
  df_Sum123 <- NumInspecciones(df_Sum123)
  
  return (df_Sum123)
}