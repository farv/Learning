-- PD 2010-11
-- 3ª práctica (26 de octubre)
-- Departamento de Ciencias de la Computación e I.A.
-- Universidad de Sevilla
-- =====================================================================
import Test.QuickCheck 
import Char
-- ----------------------------------------------------------------------------
-- Ejercicio 1 (Extracciones e inserciones)
-- ----------------------------------------------------------------------------
-- Ejercicio 1.1. Define la función extrae tal que (extrae xs n) es la lista
-- resultado de eliminar el elemento n-ésimo de la lista xs. Si n es negativo
-- o mayor que la longitud de la lista, el resultado debe ser la misma
-- lista. Por ejemplo,
--    extrae [1,2,3,4,5] 2     ==>  [1,2,4,5] 
--    extrae [1,2,3,4,5] 4     ==>  [1,2,3,4] 
--    extrae [1,2,3,4,5] (-1)  ==>  [1,2,3,4,5] 
--    extrae [1,2,3,4,5] 7     ==>  [1,2,3,4,5] 
-- ---------------------------------------------------------------------------- 

extrae :: Eq a => [a] -> Int -> [a]
extrae xs n | n>(length xs)-1 = xs 
	    | n>=0 = [x | x<-xs , x/= (xs !! n)]
	    | otherwise = xs

-- ----------------------------------------------------------------------------
-- Ejercicio 1.2. Define la función inserta tal que (inserta xs x n) debe
-- introducir el elemento x en la posición n de la lista xs. Si (n<=0) el
-- elemento se insertará al principio de la lista. Si n es igual o mayor que
-- la longitud de la lista, el elemento x se colocará al final de la lista. Por
-- ejemplo,
--    inserta [1,3,5] 7 1     ==>  [1,7,3,5]
--    inserta [1,3,5] 7 3     ==>  [1,3,5,7] 
--    inserta [1,3,5] 7 (-1)  ==>  [7,1,3,5] 
--    inserta [1,3,5] 7 9     ==>  [1,3,5,7] 
-- ----------------------------------------------------------------------------

inserta :: [a]-> a -> Int -> [a]
inserta xs x n | n<=0 = x:xs
			   | n>= length xs = xs++[x]
			   | otherwise = [a|a<-take n xs ]++[x]++[b|b<-drop n xs]

-- ----------------------------------------------------------------------------
-- Ejercicio 1.3. Comprobar con QuickCheck que si se inserta el elemento
-- n-ésimo de una lista xs en la posición n de la lista resultante de extraer el 
-- elemento n-ésimo de xs, entonces se obtiene de nuevo la lista xs.
-- ----------------------------------------------------------------------------

prop_lista xs n x = xs == inserta (extrae xs n) x n


-- ----------------------------------------------------------------------------
-- Ejercicio 2. (Reconocimiento de permutaciones)
-- ----------------------------------------------------------------------------
-- Una permutación de una lista es otra lista con los mismos elementos,
-- pero posiblemente en distinto orden. Por ejemplo, [1,2,1] es una
-- permutación de [2,1,1] pero no de [1,2,2].
--
-- Definie la función esPermutacion tal que (esPermutacion xs ys) se verifique 
-- si xs es una permutación de ys. Por ejemplo, 
--    esPermutacion [1,2,1] [2,1,1]  ==>  True
--    esPermutacion [1,2,1] [1,2,2]  ==>  False
-- * Comprobar con QuickCheck que si una lista es una permutación de
-- otra, las dos tienen el mismo número de elementos. 
-- * Comprobar con QuickCheck que la inversa de una lista es una
-- permutación de la lista.
-- ----------------------------------------------------------------------------

cuentaElemento :: (Eq a) => a -> [a] -> Int
cuentaElemento x ls = sum[ 1 | l<-ls , x==l]

mismaCantidad :: (Eq a) => a -> [a]->[a]->Bool
mismaCantidad  x ls1 ls2 = cuentaElemento x ls1 == cuentaElemento x ls2

esPermutacion :: (Eq a) =>  [a]->[a]->Bool
esPermutacion ls1 ls2 = and [mismaCantidad x ls1 ls2 | x <- ls1] &&
                        and [mismaCantidad x ls1 ls2 | x <- ls2]


prop1 ls1 ls2 = esPermutacion ls1 ls2 ==> length ls1 == length ls2

-- ----------------------------------------------------------------------------
-- Ejercicio 3. (Mayúsculas iniciales)
-- ----------------------------------------------------------------------------
-- Se consideran las siguientes reglas de mayúsculas iniciales para los títulos: 
--    * la primera palabra empieza con mayúscula, 
--    * todas las palabras que tienen 4 letras como mínimo empiezan
--      con mayúsculas,
--    * el resto de caracteres se escriben en minúscula.
--
-- Define la función titulo tal que (titulo ps) es la lista de las palabras 
-- de ps con las reglas de mayúsculas iniciales de los títulos. Por ejemplo,
--    *Main> titulo ["eL","arTE","DE","La","proGraMacion"]
--    ["El","Arte","de","la","Programacion"]
-- Nota: Usa las funciones toLower y toUpper del módulo Char.
-- ----------------------------------------------------------------------------

enMinusculas :: [Char] -> [Char]
enMinusculas lts = [toLower x | x<-lts ]

primeraMayuscula :: [Char] -> [Char]
primeraMayuscula (l:ls) = (toUpper l) : (enMinusculas ls)

titulo :: [[Char]] -> [[Char]]
titulo (p:ps) = (primeraMayuscula p):[if 4 <= length pl then
                                          primeraMayuscula pl else
                                          enMinusculas pl | pl<-ps]

-- ----------------------------------------------------------------------------
-- Ejercicio 4.
-- ----------------------------------------------------------------------------

-- Haciendo uso de la lista [1..10] definir las siguientes listas por
-- comprensión. 

-- [11,12,13,14,15,16,17,18,19,20] 
--[x+10 | x<-[1..10]]

-- [[2],[4],[6],[8],[10]] 
--[[x] | x<-[1..10], even x] 

-- [10,9,8,7,6,5,4,3,2,1] 
-- [11-x | x<-[1..10]

-- [True,False,True,False,True,False,True,False,True,False] 
-- [not (even x) | x <- [1..10]]

-- [(3,True),(6,True),(9,True),(12,False),(15,False),(18,False)] 
-- [(3*x, x<=3) | x<-[1..10], x<=6]

-- [(11,12),(13,14),(15,16),(17,18),(19,20)]  
-- [(x+10,x+11) | x<-[1..10], not (even x)]

-- [[5,6,7],[5,6,7,8,9],[5,6,7,8,9,10,11],[5,6,7,8,9,10,11,12,13]] 
-- [[5..4+x]      |x<-[1..10], x>=3 , odd x  ] 
    
-- ----------------------------------------------------------------------------


-- ----------------------------------------------------------------------------
-- Ejercicio 5.
-- ----------------------------------------------------------------------------
-- Definir una función esSubcadena (usar la función(isPrefixOf ys xs)
-- que se verifica si ys es un prefijo de xs del módulo Data.List),
-- para determinar si una cadena x aparece en otra y..








-- ----------------------------------------------------------------------------
