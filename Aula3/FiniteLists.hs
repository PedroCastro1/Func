module FiniteLists where



{-

 Todas listas (finitas ou infinitas) em Haskell
 são definidas somente com dois operadores:
 
  (:):: a -> [a] -> [a] (append left, right associative)
  []::a (empty list)
  
  Notação: [x1,x2,...,xn]=abbr x1:(x2(:...(xn:[])))
-}

list01::[Int]
list01 = 0:(1:(2:(3:[])))
list01'::[Int]
list01' = 5:list01

list02::[Int]
list02 = [0,1,2,3]

bool01::Bool
bool01 = list01 == list02

bool01'::Bool 
bool01' = list01 == list01'

cadeia::[Char]
cadeia = "Hello World"

-- Alguns Exemplos com funções do Prelúdio

lista1 = length cadeia -- comprimento da lista
lista2 = cadeia ++ cadeia  -- concatenação de listas
lista3 = head cadeia -- cabeça da lista
lista4 = tail cadeia  -- cauda da lista
lista5 = take 3 cadeia  -- prefixo de comprimento 2
lista6 = drop 2 cadeia -- sufixo após remoção dos dois primeiros elementos
lista7 = last cadeia  -- último elemento
lista8 = init cadeia  -- lista resultante da remoção do último elemento
lista9 = cadeia !! 3   -- terceiro elemento da lista
lista10 = reverse cadeia  -- reversão da lista
lista11 = head (1:undefined)
lista12 = tail (1:undefined)
lista13 = null []
lista14 = null "Hello"
lista15 = [1,3..20]
lista16 = [1,2..]
bool02  = cadeia == ['c','a','d','e','i','a']
bool05  = (take 5 cadeia) == "Hello"
bool03 = [1,2,3]==1:[2,3]
bool04 = [1,2,3]==1:2:3:[]


{-
 Seção: Funções sobre Listas
 
 Como toda lista l é definida como 
   1) l==[], -- a lista é vazia ou
   2) l= x:xs, tal que head(l)=x e tail(l)=xs -- a lista tem uma cabeça e uma cauda
   
   Podemos definir funções através de pattern matching
-}

-- versão recomendada
isNull::[a]->Bool
-- requer - 
-- garante isNull=True se a lista é vazia. Falso, c.c.
isNull [] = True
isNull (x:xs) = False

-- ou 
isNull'::[a]->Bool
isNull' x | null x = True
          | otherwise = False 

{-
 Exercícios: Definir suas próprias versões para as funções apresentadas acima.
-}

mlength::Num a => [t]->a
-- Versão recursiva para mlength
-- requer True 
-- garante mlength(xs) = length(xs)
--    ou
-- garante mlength([x0,...,xn]) = n+1
mlength([]) = 0
mlength (x:xs) = 1 + mlength(xs)

 
tail_length:: [t]->Int
-- requer requer True 
-- garante mlength(xs) = length(xs)
tail_length(xs) = length_acc(xs,0) where   
    length_acc::([a],Int)->Int
    length_acc([],a) = a 
    length_acc(y:ys,a) = length_acc(ys,a+1)
   
