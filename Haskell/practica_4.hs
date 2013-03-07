-- PD 2010-11
-- 4ª práctica (2 de noviembre)
-- Departamento de Ciencias de la Computación e I.A.
-- Universidad de Sevilla
-- =====================================================================
-- ----------------------------------------------------------------------------
-- Ejercicio 1 
-- ----------------------------------------------------------------------------
-- Define la función posición tal que (posicion x xs) es la primera 
-- posición del elemento x en la lista ys (empezando a contar por 1) 
-- o bien 0 si x no pertenece a lista xs. Por ejemplo:
--
-- posicion 5 [1,5,3,5,6,5,3,4] => 2
-- posicion 'l' "Haskell"       => 6
-- posicion 7 [1,5,3,5,6,5,3,4] => 0
--
-- Da una definición por recursión y otra usando listas de comprensión.
-- -----------------------------------------------------------------------------

posicion :: Eq a => a -> [a] -> Int
posicion x [] = 0
posicion x (x1:xs) | x==x1 = 1
                   | otherwise = if (posicion x xs)==0 then 0 else
                                     (posicion x xs) +1

-- ----------------------------------------------------------------------------
-- Ejercicio 2 
-- ----------------------------------------------------------------------------
-- Se dice que una sucesión x1,...,xn está ordenada cíclicamente si existe 
-- un índice i tal que la sucesión xi, xi+1, ..., xn, x1, ..., xi-1 está 
-- ordenada (en orden creciente). Define la función
--      ordenadaCiclicamente :: Ord a => [a] -> Int
-- tal que (ordenadaCiclicamente xs) es el primer índice, empezando a contar 
-- los índices por 1, a partir del cual está ordenada si la lista está ordenada
-- cíclicamente; y 0 en caso contrario. Por ejemplo:
--
-- ordenadaCiclicamente [1,2,3,4]     => 1
-- ordenadaCiclicamente [4,6,7,5,4,3] => 0
-- ordenadaCiclicamente [5,8,2,3]     => 3
-- ordenadaCiclicamente [7,9,2,2,2]   => 3
-- ------------------------------------------------------------------------------

estaOrdenado xs = x <- xs

ordenaCiclicamente :: Ord a => [a] -> Int
ordenaCiclicamente (x:xs) = concat[(drop n xs),(take n xs)]

ordenaCicliAux 
ordenaCicliAux n xs = concat[drop n xs,take n xs]

-- ----------------------------------------------------------------------------
-- Ejercicio 3 
-- ----------------------------------------------------------------------------
-- La conjetura de Goldbach dice que todo número par mayor que dos puede 
-- obtenerse como la suma de dos números primos. Por ejemplo, 28 = 5 + 23.
-- Esta conjetura es uno de los problemas abiertos más famosos en la teoría 
-- de números. Se ha comprobado que es cierta para una gran cantidad de 
-- casos, pero se desconoce si es o no cierta para cualquier número par por 
-- grande que sea.
-- Define una función (goldbach x) que devuelva un par de números primos 
-- (a,b) tales que x = a + b.  Por ejemplo:
--
-- goldbach 28 = (5,23)
-- goldbach 36 = (13,23)
-- ----------------------------------------------------------------------------

golbach :: Num a => a -> (a,a)
golbach x | even x && x > 2 = 
          | otherwise = (0,0)


