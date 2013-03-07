'''
Created on 28/04/2010

@author: fran
'''

class matrizConDiccionario():
    
    def __init__(self, filas, columnas): #tamanho de la casilla
        self.filas = filas
        self.columnas = columnas
        self.matriz = {} #campo de batalla definido por un diccionario
        i=0 #Numero de las filas, define la anchura del campo de batalla, 
        while (i<filas):
            j=0 #Numero de columnas, define la longitud (distancia) del campo de batalla
            while (j<columnas):
                tupla = i,j
                self.matriz[tupla] = None
                #Por ahora, todo el campo de batalla es visitable
                j=j+1
            i=i+1
            
    def __len__(self):
        pass
        #devolver el tamagno de la matriz, filas y columnas
    
    def getPosicion (self, posicion): #posicion es una tupla
        if posicion[0]<self.filas and posicion[1]<self.columnas:
            return self.matriz[posicion]
        else:
            pass
            #hay que capturar las excepciones
    
    def setPosicion (self, posicion, objeto): #posicion es una tupla
        if posicion[0]<self.filas and posicion[1]<self.columnas:
            self.matriz[posicion] = objeto
        else:
            pass
            #hay que capturar la excepcion

    def getFila (self, fila): #fila es un entero
        lista = []
        if fila>=self.filas:
            pass #Lanzar excepcion
        else:
            i=0
            while i<self.columnas:
                tupla = (i,fila)
                lista.__add__(self.getPosicion(tupla))
                i = i+1
        return lista
    
    def getColumna (self, columna): #columna es un entero
        lista = []
        if columna>=self.columnas:
            pass #Lanzar excepcion
        else:
            i=0
            while i<self.filas:
                tupla = (i,columna)
                lista.__add__(self.getPosicion(tupla))
                i = i+1
        return lista
    
    def setFila (self, fila, filaNueva): #filaNueva es una tupla del tamagno adecuado
        if fila>=self.filas:
            pass #Lanzar excepcion
        else:
            i=0
            while i<self.columnas:
                tupla = (i,fila)
                
                self.setPosicion(filaNueva[i], tupla)
                i = i+1
                
    def setColumna (self, columna, columnaNueva): #filaNueva es una tupla del tamagno adecuado
        if columna>=self.filas:
            pass #Lanzar excepcion
        else:
            i=0
            while i<self.columnas:
                tupla = (i,columna)
                elemento = columnaNueva[i]
                self.setPosicion(elemento, tupla)
                i = i+1

    def __str__ (self):
        cadena = "A ver si esta bien hecha: "
        i=0
        while (i<self.filas):
            j=0
            while (j<self.columnas):
                tupla = i,j
                cadena = cadena + "; " + str(tupla) + ", " + str(self.getPosicion(tupla))
                j=j+1
            i=i+1
        return cadena