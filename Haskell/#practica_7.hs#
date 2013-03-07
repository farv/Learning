-- Calculo de secuentes
-- ---------------------------------------------------------------------

import Data.List

-- ---------------------------------------------------------------------
-- Fórmulas Proposicionales
-- ---------------------------------------------------------------------

-- Recordemos los tipos definidos para la representación de una
-- fórmula proposicional en la práctica anterior.

type Simbolo = String

data Formula = Atomica Simbolo
           | Negacion Formula
           | Disyuncion Formula Formula
             deriving (Eq)

-- ---------------------------------------------------------------------
-- Ejercicio:
-- Incluir el tipo Formula en la clase Show y definir la función show
-- para indicar la imagen de una fórmula.

-- Ejemplos:

-- > Atomica "p"
-- p
-- > Disyuncion (Negacion (Atomica "p")) (Atomica "q")
-- no p \/ q
-- ---------------------------------------------------------------------

instance Show Formula where 
    show (Atomica p)=p
    show (Negacion p)= "no " ++ show p
    show (Disyuncion p q) =  show p ++ " \\/ " ++ show q


-- ---------------------------------------------------------------------
-- Consideremos las siguientes fórmulas proposicionales atómicas:
-- ---------------------------------------------------------------------

p, q, r, s :: Formula
p  = Atomica "p"
q  = Atomica "q"
r  = Atomica "r"
s  = Atomica "s"

-- ---------------------------------------------------------------------
-- Ejercicio:
-- Definir la función
--    no :: Formula -> Formula
-- tal que (no f) es la negación de f.

-- Ejemplos:
-- > no p
-- no p
-- > Disyuncion (no (Atomica "p1")) (Atomica "p2")
-- (no p1 \/ p2)
-- > no r == (Negacion (Atomica "r"))
-- True
-- ---------------------------------------------------------------------

no :: Formula -> Formula
--no f  = Negacion f 
no  = Negacion




-- ---------------------------------------------------------------------
-- Ejercicio: Definir el operador:
--   (\/) :: Formula -> Formula -> Formula
-- tale que
--    f \/ g      es la disyunción de f y g

-- Ejemplos
-- > no p \/ no q
-- (no p \/ no q)
-- > (no p \/ q) == Disyuncion (Negacion (Atomica "p")) (Atomica "q")
-- True
-- ---------------------------------------------------------------------

(\/) :: Formula -> Formula -> Formula
--(\/) f g  = Disyunion f g
(\/)  = Disyuncion  




-- ---------------------------------------------------------------------
-- Consideremos los operadores de la práctica anterior:
--    (/\), (-->) :: Formula -> Formula -> Formula
-- tales que
--    f /\ g      es la conjunción de f y g
--    f ==> g     es la implicación de f a g

-- Ejemplos:
-- > p ==> q
-- (no p \/ q)
-- > (p ==> q) == Disyuncion (Negacion (Atomica "p")) (Atomica "q")
-- True
-- ---------------------------------------------------------------------

(/\), (==>) :: Formula -> Formula -> Formula
f /\ g = Negacion (Disyuncion (Negacion f) (Negacion g))
f ==> g  = Disyuncion (Negacion f) g

-- ---------------------------------------------------------------------
-- Un secuente es un par formado por dos conjuntos de fórmulas:
-- { F1 , ... , Fn } |-= { G1 , ... , Gm }
-- Al conjunto {F1 , ... , Fn} se le denomina antecedente del
-- secuente
-- Y al conjunto {G1 , ... , Gm} se le denomina consecuente del
-- secuente 

-- El secuente anterior es equivalente a la fórmula:
-- F1 /\ F2 /\ ... /\ Fn --> G1 \/ G2 \/ ... \/ Gm

-- ---------------------------------------------------------------------
-- Ejercicio: 
-- Definir el tipo de datos Secuente para representar los secuentes
-- como pares de listas de formulas.
-- ---------------------------------------------------------------------

type Secuente = ([Formula ], [Formula])


-- ---------------------------------------------------------------------
-- Las reglas del cálculo de secuentes indican cómo descomponer una
-- fórmula de un secuente (denominado secuente objetivo) para obtener
-- un conjunto de secuentes (denominado subobjetivos). En general se
-- representan por:

-- Subobjetivos
-- ============  Regla
-- Objetivo
-- ---------------------------------------------------------------------

-- ---------------------------------------------------------------------
-- Consideraremos las siguientes reglas:

-- ==============================   Ax
-- { G1 , F , G2 |- D1 , F , D2 }


-- { G1 , G2} |-{ F , D }
-- =======================    no I
-- { G1 , no F , G2} |-{ D }


-- { F , G} |-{ D1 , D2 }
-- =======================    no D
-- { G} |-{ D1 , no F , D2 }


-- { G1 , F , G2} |-{ D G1 }     { G , G2} |-{ D }
-- ===========================================    \/ I
-- { G1 , F \/ G , G2} |-{ D }


-- { G} |-{ D1 , F , G , D2 }
-- =========================    \/ D
-- { G} |-{ D1 , F \/ G , D2 }


-- donde G, G1, G2, D, D1 y D2 son sucesiones finitas de fórmulas
-- ---------------------------------------------------------------------

-- ---------------------------------------------------------------------
-- Procedimiento para calcular la validez de una fórmula mediante el
-- cálculo de secuentes:
-- * Considerar F como secuente objetivo inicial
-- * Se van aplicando las reglas dando lugar a nuevos subobjetivos
-- * El proceso se repite hasta que todos los subobjetivos han sido
-- eliminados mediante la Regla del Axioma. En ese caso, la fórmula F
-- es válida.
-- * Si se alcanza un subobjetivo al que no puede aplicarse ninguna
-- regla, entonces F no es válida.
-- ---------------------------------------------------------------------

-- ---------------------------------------------------------------------
-- Ejemplo:
-- Demostrar la validez de la fórmula p ==> (q \/ p) mediante el
-- cálculo de secuentes:

-- La fórmula p ==> (q \/ p) es el secuente objetivo inicial:
-- {  } |- { (no p \/ (q \/ p)) }

-- Aplicamos la regla "\/ D" a (no p \/ (q \/ p))

-- {  } |- { no p , (q \/ p) }
-- ==============================    \/ D
-- {  } |- { (no p \/ (q \/ p)) }


-- Aplicamos la regla "no D" a (no p)

-- { p } |- { (q \/ p) }
-- ===========================    no D
-- {  } |- { no p , (q \/ p) }

-- Aplicamos la regla "\/ D" a (q \/ p)

-- { p } |- { q , p }
-- =====================    \/ D
-- { p } |- { (q \/ p) }

-- Aplicamos la regla "Ax" 

-- ==================    Ax
-- { p } |- { q , p }
-- ---------------------------------------------------------------------

-- ---------------------------------------------------------------------
-- Otro ejemplo:
-- Demostrar la validez del secuente { (no p \/ q) , p } |- { q }
-- mediante el cálculo de secuentes:

-- Aplicamos la regla "\/ I" a (no p \/ q)

-- { no p , p } |- { q }     { q , p } |- { q }
-- ============================================    \/ I
-- { (no p \/ q) , p } |- { q }

-- Se obtienen dos subobjetivos:
-- Aplicamos la regla "no I" a (no p) [del primer subobjetivo]

--    { p } |- { p , q }
--    =====================    no I
--    { no p , p } |- { q }

-- Aplicamos la regla "Ax"

--    ==================    Ax
--    { p } |- { p , q }


-- Aplicamos la regla "Ax" [al segundo subobjetivo]

--    ==================    Ax
--    { q , p } |- { q }

-- ---------------------------------------------------------------------
-- Ejercicio: 
-- Definir el tipo de datos CalculoSec para representar
-- una sucesión de reglas de calculo de secuentes. Tener en cuenta que
-- dicha sucesión puede tener distintas ramas ya que hay reglas que
-- dan lugar a varios subobjetivos.
-- Incluir una imagen para dicho tipo que haga legible a los elementos
-- del mismo.
-- ---------------------------------------------------------------------

data CalculoSec = Rama [Secuente] String Secuente [CalculoSec]

instance Show CalculoSec where 
    show (Rama ls regla s []) = 
        show ls ++ "\n ========================== " ++ regla ++ "\n" ++
        show s 
    show (Rama ls regla s [cs]) = 
        show ls ++ "\n ========================== " ++ regla ++ "\n" ++
        show s ++ "\n 1 \n" ++ show cs
    show (Rama ls regla s [cs1,cs2]) = 
        show ls ++ "\n ========================== " ++ regla ++ "\n" ++
        show s ++ "\n 1 \n" ++ show cs1 ++ "\n 2 \n" ++ show cs2




-- ---------------------------------------------------------------------
-- Pruebas mediante secuentes                                         --
-- ---------------------------------------------------------------------

-- ---------------------------------------------------------------------
-- Ejercicio: 
-- ---------------------------------------------------------------------
-- 1.- Definir la función
--    esAxioma :: Secuente -> Bool
-- tal que (esAxioma s) se verifica si el secuente s es un axioma. Por
-- ejemplo,
--    esAxioma ([p /\ q, r], [r ==> q, p /\ q])  ==>  True
--    esAxioma ([p /\ q, r], [r ==> q, p, q])    ==>  False
-- ---------------------------------------------------------------------

esAxioma :: Secuente -> Bool
esAxioma (as,cs) = or [ a `elem` cs | a <- as] 


-- ---------------------------------------------------------------------
-- 2.- Definir la función
--    todasAtomicas :: Secuente -> Bool
-- tal que (todasAtomica sc) se verifica si todas las formulas de sc
-- son atómicas. Por ejemplo, 
--    todasAtomicas ([],[p])         ==>  True
--    todasAtomicas ([p /\ q],[q])   ==>  False
-- ---------------------------------------------------------------------
                                    




-- ---------------------------------------------------------------------
-- 3.- Definir la función
--    pruebaSec :: Secuente -> CalculoSec
-- tal que (pruebaSec s) es el resultado de aplicar sucesivas reglas de
-- calculo de secuentes hasta que ya no sea aplicable ninguna. Por
-- ejemplo,
{-
> pruebaSec ([],[p ==> (q \/ p)])
{  } |- { no p , (q \/ p) }
==============================    \/ D
{  } |- { (no p \/ (q \/ p)) }


{ p } |- { (q \/ p) }
===========================    no D
{  } |- { no p , (q \/ p) }


{ p } |- { q , p }
=====================    \/ D
{ p } |- { (q \/ p) }


==================    Ax
{ p } |- { q , p }

> pruebaSec ([],[(p /\ (p ==> q)) ==> q])

{  } |- { no no (no p \/ no (no p \/ q)) , q }
=================================================    \/ D
{  } |- { (no no (no p \/ no (no p \/ q)) \/ q) }


{ no (no p \/ no (no p \/ q)) } |- { q }
==============================================    no D
{  } |- { no no (no p \/ no (no p \/ q)) , q }


{  } |- { (no p \/ no (no p \/ q)) , q }
========================================    no I
{ no (no p \/ no (no p \/ q)) } |- { q }


{  } |- { no p , no (no p \/ q) , q }
========================================    \/ D
{  } |- { (no p \/ no (no p \/ q)) , q }


{ p } |- { no (no p \/ q) , q }
=====================================    no D
{  } |- { no p , no (no p \/ q) , q }


{ (no p \/ q) , p } |- { q }
===============================    no D
{ p } |- { no (no p \/ q) , q }


{ no p , p } |- { q }     { q , p } |- { q }
============================================    \/ I
{ (no p \/ q) , p } |- { q }


   { p } |- { p , q }
   =====================    no I
   { no p , p } |- { q }


   ==================    Ax
   { p } |- { p , q }


   ***


   ==================    Ax
   { q , p } |- { q }
-}
-- ---------------------------------------------------------------------

pruebaSec :: Secuente -> CalculoSec
pruebaSec (as, (Disyuncion f g): cs) = 
    Rama [(as, f:g:cs)] "\\/ D " (as,(Disyuncion f g): cs)
         []





-- ---------------------------------------------------------------------
-- Demostrabilidad por secuentes                                      --
-- ---------------------------------------------------------------------

-- ---------------------------------------------------------------------
-- 4.- Definir la función
--    esProbableSec :: Secuente -> Bool
-- tal que (esProbableSec s) se verifica si s es probable. Por
-- ejemplo,  
-- esProbableSec ([p ==> q, q ==> r],[p ==> r])  ==>  True
-- esProbableSec ([p ==> q, q ==> r],[(p ==> r) /\ (r ==> p)]) ==>  False
-- esProbableSec ([],[p ==> p])                  ==>  True
-- esProbableSec ([p /\ no p],[])                ==>  True
-- ---------------------------------------------------------------------






-- ---------------------------------------------------------------------
-- A partir de las funciones anteriores se pueden definir las
-- funciones:

--    esValidaSec :: Formula -> Bool
-- tal que (esValidaSec f) se verifica si f es valida, utilizando
-- el cálculo de secuentes para determinarlo. Por ejemplo,
-- esValidaSec ((p ==> q) /\ (q ==> r) ==> (p ==> r)) ==> True
-- esValidaSec ((p ==> q) /\ (q ==> r) ==> (p ==> s)) ==> False
--    esValidaSec (p ==> (q \/ p))                    ==>  True
--    esValidaSec ((p /\ (p ==> q)) ==> q)            ==>  True

-- Teniendo en cuenta que una fórmula F es equivalente al secuente
-- {} |- {F}

-- ---------------------------------------------------------------------

-- esValidaSec :: Formula -> Bool
-- esValidaSec f = esProbableSec ([], [f])

-- ---------------------------------------------------------------------
--    pruebaConsecSec  :: [Formula] -> Formula -> CalculoSec
-- tal que (pruebaConsecSec s f) es el resultado de aplicar sucesivas
-- reglas de calculo de secuentes hasta que ya no sea aplicable
-- ninguna para comprobar si f es consecuencia de s. Por
-- ejemplo, 

-- Teniendo en cuenta que, dados un conjunto de fórmulas S y una
-- fórmula F, demostrar S |= F es equivalente a demostrar la validez
-- del secuente S |- {F}

{-
Secuentes> pruebaConsecSec [p ==> q, q ==> r] (p ==> r)

{ no p , (no q \/ r) } |- { (no p \/ r) }     { q , (no q \/ r) } |- { (no p \/ r) }
====================================================================================    \/ I
{ (no p \/ q) , (no q \/ r) } |- { (no p \/ r) }


   { (no q \/ r) } |- { p , (no p \/ r) }
   =========================================    no I
   { no p , (no q \/ r) } |- { (no p \/ r) }


   { no q } |- { p , (no p \/ r) }     { r } |- { p , (no p \/ r) }
   ================================================================    \/ I
   { (no q \/ r) } |- { p , (no p \/ r) }


      {  } |- { q , p , (no p \/ r) }
      ===============================    no I
      { no q } |- { p , (no p \/ r) }


      {  } |- { no p , r , q , p }
      ===============================    \/ D
      {  } |- { (no p \/ r) , q , p }


      { p } |- { r , q , p }
      ============================    no D
      {  } |- { no p , r , q , p }


      ======================    Ax
      { p } |- { r , q , p }


      ***


      { r } |- { no p , r , p }
      ============================    \/ D
      { r } |- { (no p \/ r) , p }


      =========================    Ax
      { r } |- { no p , r , p }


   ***


   { q , (no q \/ r) } |- { no p , r }
   ======================================    \/ D
   { q , (no q \/ r) } |- { (no p \/ r) }


   { p , q , (no q \/ r) } |- { r }
   ===================================    no D
   { q , (no q \/ r) } |- { no p , r }


   { no q , p , q } |- { r }     { r , p , q } |- { r }
   ====================================================    \/ I
   { (no q \/ r) , p , q } |- { r }


      { p , q } |- { q , r }
      =========================    no I
      { no q , p , q } |- { r }


      ======================    Ax
      { p , q } |- { q , r }


      ***


      ======================    Ax
      { r , p , q } |- { r }
-}
-- ---------------------------------------------------------------------

-- pruebaConsecSec :: [Formula] -> Formula -> CalculoSec
-- pruebaConsecSec s f = pruebaSec (s, [f])

-- ---------------------------------------------------------------------
--    esConsecuenciaSec :: [Formula] -> Formula -> Bool
-- tal que (esConsecuenciaSec s f) se verifica si f es consecuencia de
-- s, utilizando el calculo de secuentes para determinarlo. Por
-- ejemplo,
--    esConsecuenciaSec [p ==> q, q ==> r] (p ==> r)
--    ==> True
-- ---------------------------------------------------------------------

-- esConsecuenciaSec :: [Formula] -> Formula -> Bool
-- esConsecuenciaSec  s f = esProbableSec (s, [f])

-- ---------------------------------------------------------------------

