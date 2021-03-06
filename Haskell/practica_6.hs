-- PD 2010-11
-- 6ª práctica (16 de noviembre)
-- Departamento de Ciencias de la Computación e I.A.
-- Universidad de Sevilla
-- =====================================================================

-- -------------------------------------------------------------------
-- Ejercicio 1.1 Demostrar que elimina 3 [1,2,3,4,5] == [4,5]
-- a partir de la definición

elimina :: Int -> [a] -> [a]
elimina 0 xs         = xs           -- elimina.1
elimina (n+1) []     = []           -- elimina.2
elimina (n+1) (x:xs) = elimina n xs -- elimina.3

-- -------------------------------------------------------------------

-- elimina 3 [1,2,3,4,5] = [por 3 == 2+1 y [1,2,3,4,5] == 1:[2,3,4,5]
-- elimina (2+1) (1:[2,3,4,5]) = [por def. elimina.3]
-- elimina 2 [2,3,4,5] = [por 3 == 2+1 y [1,2,3,4,5] == 1:[2,3,4,5]
-- elimina (1+1) (2:[3,4,5]) = [por def. elimina.3]
-- elimina 1 [3,4,5] = [por 1 == 0+1 y [3,4,5] == 3:[4,5]
-- elimina 0+1 (3:[4,5]) = [por def. elimina 3]
-- elimina 0 [4,5] = [4,5]



-- -------------------------------------------------------------------
-- Ejercicio 1.2 Consideremos las siguientes funciones:

inserta :: (Ord a) => a -> [a] -> [a] 
inserta y []  = [y]                             -- inserta.1
inserta y (x:xs) | y <= x = y:(x:xs)            -- inserta.2.1
                 | otherwise = x:(inserta y xs) -- inserta.2.2

esOrdenada :: (Ord a) => [a] -> Bool
esOrdenada [] = True                                -- esOrdenada.1
esOrdenada [x] = True                               -- esOrdenada.2
esOrdenada (y:(x:xs)) = y <= x && esOrdenada (x:xs) -- esOrdenada.3

-- Demostrar que para cualquier elemento, y, y cualquier lista, xs, se
-- tiene que esOrdenada xs ==> esOrdenada (inserta y xs)
-- -------------------------------------------------------------------





-- -------------------------------------------------------------------
-- Ejercicio 2.1 Redefinir, usando foldr, la siguiente función:

aCada :: (a -> b) -> [a] -> [b]
aCada f [] = []
aCada f (x:xs) = (f x):(aCada f xs)

-- aCadaF (+1) [2,3,4]           ==> [3,4,5]
-- aCadaF (tail) [[2,3],[4,5,6]] ==> [[3],[5,6]]
-- -------------------------------------------------------------------

aCada1 = map

-- -----------------------------------------------------

aCadaF f xs = foldr (\x xs -> (f x):xs) [] xs

-- -----------------------------------------------------

aCadaF2 f xs = foldr (op1 f) [] xs

op1 f x xs = (f x):xs

-- -------------------------------------------------------------------
-- Ejercicio 2.2 Redefinir, usando foldr, la función filtra.

filtra :: (a -> Bool) -> [a] -> [a]
filtra p [] = []
filtra p (x:xs) | (p x) = x:(filtra p xs)
                | otherwise = (filtra p xs)

-- filtraF (even) [2,3,4]     ==> [2,4]
-- filtraF (>4) [1,1,2,4,5,6] ==> [5,6]
-- -------------------------------------------------------------------

filtraF :: (a -> Bool) -> [a] -> [a]
filtraF p xs = foldr (op2 p) [] xs

op2 p x xs | p x = x:xs
	   | otherwise = xs

-- -------------------------------------------------------------------
-- Ejercicio 2.3 Definir, usando foldl, la función
--    dec2ent :: [Int] -> Int
-- tal que (dec2ent xs) es el entero correspondiente a la expresión
-- decimal xs. Por ejemplo,
--    dec2ent [2,3,4,5]  =>  2345
-- -------------------------------------------------------------------

dec2ent :: [Int] -> Int
dec2ent xs = foldl (\ x y -> 10*x + y) 0 xs

-- -------------------------------------------------------------------
-- Se considera el siguiente tipo de árboles binarios

data ArbolB = Hoja | Nodo ArbolB ArbolB
              deriving (Eq, Ord, Show)
-- Ejercicio 3.1 Definir la función 
--    nHojas :: ArbolB -> Int
-- tal que (nHojas a) es el número de hojas del árbol a. Por ejemplo,
--    nHojas (Nodo Hoja (Nodo Hoja Hoja)) ==>  3
-- -------------------------------------------------------------------

-- nHojas :: ArbolB -> Int
-- nHojas a | a == Hoja       = 1
--          | a == (Nodo x y) = nHojas x + nHojas y

nHojas :: ArbolB -> Int
nHojas Hoja       = 1
nHojas (Nodo x y) = nHojas x + nHojas y

-- -------------------------------------------------------------------
-- Se dice que un árbol binario es balanceado si es una hoja o bien
-- para cada nodo se tiene que el número de hojas en cada uno de sus
-- subárboles difiere como máximo en uno y sus subárboles son
-- balanceados. 

-- Ejercicio 3.2 Definir la función
--    balanceado :: ArbolB -> Bool
-- tal que (balanceado a) se verifica si a es un árbol balanceado. Por
-- ejemplo, 
--    balanceado (Nodo Hoja (Nodo Hoja Hoja))
--    ==> True
--    balanceado (Nodo (Nodo Hoja (Nodo Hoja Hoja)) (Nodo Hoja (Nodo Hoja (Nodo Hoja Hoja))))
--    ==> False
-- -------------------------------------------------------------------
 




-- -------------------------------------------------------------------

-- -------------------------------------------------------------------
-- Ejercicio 4.1 Definir los siguientes tipos de datos:
-- * Simbolos para representar los símbolos proposicionales
--   (utilizaremos las cadenas para denotar cualquier símbolo)
-- * Formula para representar las fórmulas proposicionales usando los
--   constructores Atomica, Negacion, Disjuncion para las fórmulas
--   atómicas, negaciones y disjunciones respectivamente.
--   -----------------------------------------------------------------


-- -------------------------------------------------------------------
-- Ejercicio 4.2 Definir los siguientes operadores
--    (/\), (-->) :: Formula -> Formula -> Formula
-- tales que
--    f /\ g      es la conjunción de f y g
--    f --> g     es la implicación de f a g
-- -------------------------------------------------------------------




-- ---------------------------------------------------------------------
-- Ejercicio 4.3 Definir las siguientes fórmulas atómicas: p, q, r
-- ---------------------------------------------------------------------




-- ---------------------------------------------------------------------
-- Ejercicio 4.4 Definir la funcion
--    significado :: [Simbolos] -> Formula -> Bool
-- tal que (significado xs f) devuelve el valor de verdad de f que se
-- obtiene con la asignación que a los elementos de xs les asocia el
-- valor True y a cualquier otro símbolo el valor False.

-- Main> significado ["p","r"] ((Disjuncion p q) /\ (Disjuncion (Negacion q) r))
-- True
-- Main> significado ["r"] ((Disjuncion p q) /\ (Disjuncion (Negacion q) r))
-- False
-- ---------------------------------------------------------------------





-- ---------------------------------------------------------------------
