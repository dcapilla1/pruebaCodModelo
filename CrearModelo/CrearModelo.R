rm(list=ls())
setwd("D:/ENEL/Programas R")
source("LeerFicheroTxt/LeerTxt.R")
source("UnirTablas/UnirTablas.R")
source("EscribirFicheroTxt/EscribirTxt.R")
source("ConvUTMtoLongLat/ConvUTMtoLongLat.R")
source("RellenarCoordenadas/RellenarCoordGoogle.R")
source("CompPolInd/CompPolInd.R")
source("AddVariables/AddVariables.R")
source("ComprobarTasasAFV/ComprobarTasa.R")
source("SuministrosCP/SuministrosCP.R")
source("DistanciaMasCercana/DistanciaMasCercana.R")
source("CompRural/CompRural.R")

#Fichero de suministros 1,2,3

ficheroSum123 <- "Datos/Modelo_0001_base.csv"

#Fichero de coordenadas Google

ficheroCoordGoogle <- "Datos/google_Dataset_ubicacioncups_All.csv"

#Fichero Tramo

#ficheroTramo <- "D:/ENEL/Datos/Modelo R/tdcs/tdcs_target0_target1_visitasFallidas_T123.csv"

#FicheroTramoSolape

ficheroTramoSolape <- "D:/ENEL/Datos/Modelo R/id_tramos_chunked"

#FicheroFeature

#ficheroFeature <- "D:/ENEL/Programas R/Datos/features_num_t0_t1_t1A_t1F_vf_ant_inspec_tramos_consolape_distrib_igualadas.csv"

ficheroFeature <- "D:/ENEL/Programas R/Datos/features_num_t0_t1_t1A_t1F_vf_ant_inspec_tramos_consolape.csv"

df_fichSum123<-LeerTXT(ficheroSum123, ';') 

#df_fichTramo <- LeerTXT(ficheroTramo, ';')

df_fichGoogle <- LeerTXT(ficheroCoordGoogle, '|')

df_fichFeature <- LeerTXT(ficheroFeature, ';')

df_fichTramoSolape <- LeerCSVTramo(ficheroTramoSolape, "con_solape")


df_fichSumGZA<-AddVariables("GZA")

df_sum123_GZA <- df_fichSumGZA

#df_sum123_GZA2 <- df_sum123_GZA[!duplicated(df_sum123_GZA$sce_id_cups13,df_sum123_GZA$cs_id_pm, df_sum123_GZA$tramo),]

EscribirTXT(df_sum123_GZA, 'SalidacsvGZA_entrega_DCC.csv')

#rm (df_Sum123)

rm(df_fichSumGZA)



gc()


df_fichSumCZZ<-AddVariables("CZZ")

df_sum123_CZZ <- df_fichSumCZZ

#df_sum123_CZZ <- df_sum123_CZZ[!duplicated(df_sum123_CZZ$sce_id_cups13,df_sum123_CZZ$cs_id_pm),]

EscribirTXT(df_sum123_CZZ, 'SalidacsvCZZ_entrega_DCC.csv')

#rm (dfSum123)

rm(df_fichSumCZZ)



gc()



df_fichSumSZZ<-AddVariables("SZZ")

df_sum123_SZZ <- df_fichSumSZZ

#df_sum123_SZZ <- df_sum123_SZZ[!duplicated(df_sum123_SZZ$sce_id_cups13,df_sum123_SZZ$cs_id_pm),]

EscribirTXT(df_sum123_SZZ, 'SalidacsvSZZ_entrega_DCC.csv')

rm (df_Sum123)

rm(df_fichSumSZZ)

gc()



df_fichSumUZZ<-AddVariables("UZZ")


df_sum123_UZZ <- df_fichSumUZZ

#df_sum123_UZZ <- df_sum123_UZZ[!duplicated(df_sum123_UZZ$sce_id_cups13,df_sum123_UZZ$cs_id_pm),]

EscribirTXT(df_sum123_UZZ, 'SalidacsvUZZ_entrega_DCC.csv')

rm (df_Sum123)

rm(df_fichSumUZZ)

gc()


df_fichSumJZZ<-AddVariables("JZZ")

df_sum123_JZZ <- df_fichSumJZZ

#df_sum123_JZZ <- df_sum123_JZZ[!duplicated(df_sum123_JZZ$sce_id_cups13,df_sum123_JZZ$cs_id_pm),]

EscribirTXT(df_sum123_JZZ, 'SalidacsvJZZ_entrega_DCC.csv')

rm (df_Sum123)

rm(df_fichSumJZZ)

gc()


df_total <- rbind(df_sum123_JZZ, df_sum123_UZZ, df_sum123_SZZ, df_sum123_CZZ, df_sum123_GZA)

df_totalFichero <- df_total

df_totalFichero$VUTMX[df_totalFichero$VUTMX==0] <-'NA'
df_totalFichero$VUTMY[df_totalFichero$VUTMY==0] <-'NA'
df_totalFichero$VUTMZ[df_totalFichero$VUTMZ==0] <-'NA'
df_totalFichero$FCAPTURA[df_totalFichero$FCAPTURA=="01/01/1900"] <-'NA'
names(df_totalFichero)[which(names(df_totalFichero)=="SUPERFICIE")]<- "SUPERFICIE MUNICIPIO"
names(df_totalFichero)[which(names(df_totalFichero)=="MUNICIPIO")]<- "POBLACION MUNICIPIO"
names(df_totalFichero)[which(names(df_totalFichero)=="MUNICIPIO.1")]<- "ALTITUD MUNICIPIO"


EscribirTXT(df_totalFichero, 'SalidacsvTotal_entrega_DCC.csv')

rm(df_sum123_CZZ)

rm(df_sum123_GZA)

rm(df_sum123_JZZ)

rm(df_sum123_UZZ)

rm(df_sum123_SZZ)

gc()

  