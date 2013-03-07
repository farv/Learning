'''
Created on 29/04/2010

@author: fran
'''
from matrizConDiccionario import matrizConDiccionario
#Preguntar como cogno invocar sets

class campo(matrizConDiccionario):
    
    def __init__ (self, FILAS=10, COLUMNAS=10):
        #Creamos una matrizConDiccionario
        matrizConDiccionario.__init__(self, FILAS, COLUMNAS)
        #Y la modificamos con todo a True
        i=0 #Numero de las filas, define la anchura del campo de batalla, 
        while (i<FILAS):
            j=0 #Numero de columnas, define la longitud (distancia) del campo de batalla
            while (j<COLUMNAS):
                tupla = i,j
                self.setPosicion(tupla, True) #Por ahora, todo el campo de batalla es visitable
                j=j+1
            i=i+1
            
    def poner(self, unidad, posicion): #colocar la unidad (tipo unidad) en la posicion (tipo tupla de 2 elementos numericos) 
        #Quedan por meterle las posibles excepciones
        self.setPosicion(posicion, unidad)
    
    def quitar(self,posicion):
        unidad = self.getPosicion(posicion)
        if unidad!=True or unidad!=False:
            self.setPosicion(unidad.getPosicion(), True)
            
    def moverDerecha (self, unidad): 
        #Aumenta en 1 las columnas, (i,j+1)
        #Comprueba que pueda moverse ahi antes
        if unidad.getPosicion()[1]<self.columnas-1:
            posicionNueva = (unidad.getPosicion()[0],unidad.getPosicion()[1]+1)
            self.poner(posicionNueva, unidad)
            self.quitar(unidad.getPosicion())
            unidad.setPosicion(posicionNueva)
        else:
            pass #Quedan por aprender excepciones
            
        
    def moverIzquierda (self, unidad):
        #Disminuye en 1 las columnas, (i,j-1)
        #Comprueba que pueda moverse ahi antes
        if unidad.posicion()[1]>0:
            posicionNueva = (unidad.getPosicion()[0],unidad.getPosicion()[1]-1)
            self.poner(posicionNueva, unidad)
            self.quitar(unidad.getPosicion())
            unidad.setPosicion(posicionNueva)
        else:
            pass #Quedan por aprender excepciones
            
        
    def moverAbajo (self, unidad):
        #Disminuye en 1 la fila, (i-1,j)
        #Comprueba que pueda moverse ahi antes
        if unidad.posicion()[0]>0:
            posicionNueva = (unidad.getPosicion()[0]-1,unidad.getPosicion()[1])
            self.poner(posicionNueva, unidad)
            self.quitar(unidad.getPosicion())
            unidad.setPosicion(posicionNueva)
        else:
            pass #Quedan por aprender excepciones
            

    def moverArriba (self, unidad):
        #Aumenta en 1 la fila, (i+1,j)
        #Comprueba que pueda moverse ahi antes
        if unidad.getPosicion()[0]<self.filas-1:
            posicionNueva = (unidad.getPosicion()[0]+1,unidad.getPosicion()[1])
            self.poner(posicionNueva, unidad)
            self.quitar(unidad.getPosicion())
            unidad.setPosicion(posicionNueva)
        else:
            pass #Quedan por aprender excepciones
            
    def recorridos (self, tropa):
        recorridos = []
        if tropa.movimiento<1:
            recorridos.add(self.casoBase(recorridos))
        else:
            recorridos.add(self.__auxiliarRecorridos(recorridos, tropa.getMovimiento(), tropa.getPosicion()))
        return recorridos
            
    def __auxiliarRecorridos (self,recorridos, nuevoMovimiento, posicionActual):
        pass #Mirar las 4 posiciones colindantes y agnadirlas a recorridos
            
    
    def __casoBase(self, recorridos):
        pass #agnadir la posicion actual a recorridos
    
        