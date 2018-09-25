module PrimRec  where 

{- 
1. 
Uma função recursiva primitiva f::a->b é uma função definida sobre um tipo indutivo a.
Tipos indutivos serão vistos mais adiante. Aqui então introduziremos o conceito 
para inteiros e listas finitas através de exemplos. 
-}

{-1.1 Recursão Primitiva sobre Inteiros: para definir uma função recursiva primitiva
f::Integer -> b é suficiente :


 - Associar uma constante em b a f(0).
 - Definir o valor de um inteiro n>0 em função de f(n-1)
 - Definir o valor de um inteiro n<0 em função de f(n+1), caso a função esteja
   definida para valores negativos.
-}

fat::Integer -> Integer 
-- requer n>=0 
fat n 
    | n==0 = 1  -- fat01
    | n>0 = n*fat(n-1) -- fat02 
    | otherwise = error "Fatorial não definido para valores negativos."
    
{-
Exemplo de computação: Note que a avaliação da função auxiliar é 
feita de forma atômica.

fat 3 = 3 * fat 2 (fat02)
      = 3*2* fat 1 (fat02)
      = 3*2*1*fat 0 (fat02)
      = 3*2*1*1 (fat01)
      = 6 (definição (*))
-}

{- primeira versão recursiva da soma. Somente para o caso em que 
   o primeiro agumento é positivo -}
   
add::Integer -> (Integer -> Integer)
-- requer m>=0
add m n 
  | m==0 = n  -- add01
  | m>0 = 1+ add (m-1) n -- add02
  | m < 0 = error "Primeiro argumento deve ser positivo"
  
  
{- Exemplo de computação

add 3 (-6) = 1 + add 2 (-6) (add02)
           = 1 + 1 + add 1 (-6) (add02)
           = 1 + 1 + 1 + add 0 (-6) (add02)
           = 1 + 1 + 1 + (-6) (add01)
           = -3 (definição (+))
 -}
 
{-
Exercícios: Para cada um dos exercícios abaixo, definir a função primitiva recursiva 
pedida e apresentar um exemplo de avaliação no qual ocorra pelo menos três chamadas 
recursivas. Justicar cada igualdade (redução) da avaliação.

 - Função de multiplicação sobre inteiros (um dos argumentos deve ser positivo).
 multint:: Integer -> (Integer -> Integer) 
 --requer m >=0
 multint m n 
   | m == 0 = 0 -- multint01
   | m > 0 =  n + multint (m-1) -- multint02
   | m < 0 = error "erro"

   Exemplo de avaliação

   multint 3 4 = 4 + multint 2 3 (multint02)
               = 4 + 4 + multint 1 3 (multint02)
               = 4 + 4 + 4 + multint 0 3 (multint02)
               = 4 + 4 + 4 + 0 (multint01)
               = 12 (definição (+))

 - Função de potenciação, onde a potência é um inteiro positivo.

 pot:: Integer -> Integer -> Integer
 pot b e
 	| e == 0 = 1 --pot1
 	| e > 0 = b * pot b (e-1) --pot2
 	| e < 0 = error "Expoente deve ser positivo"

Exemplo de Avaliação

pot 2 3 = 2 * pot 2 2 (pot2)
		= 2 * 2 * pot 2 1 (pot2)
		= 2 * 2 * 2 * pot 2 0 (pot2)
		= 2 * 2 * 2 * 1 (pot1)
		= 8


 - 1 + 3 + 5 + ... + k (duas versões: recursiva e através da forma fechada)

 sumImp::Integer->Integer
 sumImp nro 
 			|nro==0 = 1 --sumImp1
 			|nro > 0 = ((2*nro)+1) + sumImp (nro-1) -- sumImp2
 			|otherwise= error "Numero deve ser positivo"

 Exemplo de Avaliação 
 sumImp 3 = 7 + sumImp 2 (sumImp2)
 		  = 7 + 5 + sumImp 1 (sumImp2)
 		  =7 + 5 + 3 + sumImp 0 (sumImp2)
 		  = 7 + 5 + 3 + 1 (sumImp1)
 		  =16 

 - 1^2 + 2^2 + 3^2 + ... + k^2 (duas versões: recursiva e através da forma fechada)
 These ones are more difficult
  - Função de divisão inteira (inteiros positivos).
 - Função de resto da divisão inteira (inteiros positivos)
 - Função de soma para quaisquer inteiros.
 - Função de multiplicação para quaisquer inteiros.
 - Função de divisão inteira para quaisquer inteiros.

-}

{-
1.2 Recursão primitiva sobre listas.

Para definir uma função primitiva recursiva total f :[a]->b é suficiente:

- associar uma constante em b a f [] 
- definir f(x:xs) em função de f(xs)
-}
 
mlength::[a]->Integer 
mlength [] = 0 -- mlen01
mlength (x:xs) = 1 + mlength xs -- mlen02

{-
  Exemplo de computação:
  
  mlength [3,7,2] = mlength (3:[7,2]) (sintaxe)
                  = 1 + mlength [7,2] (mlen02)
                  = 1 + mlength (7:[2]) (sintaxe)
                  = 1 + 1 + mlength [2] (mlen02)
                  = 1 + 1 + mlength (2:[]) (sintaxe)
                  = 1 + 1 + 1 + mlength [] (mlen02)
                  = 1 + 1 + 1 + 0 (mlen01)
                  = 3 (definição (+))
                  
-}

mlast::[a]->a 
-- requer lista não vazia 
mlast (x:[])=x  -- mlast01
mlast (x:y:ys) = mlast(y:ys) -- mlast02

{-
mlast [3,2,1] = mlast (3:2:[1]) (sintaxe)
              = mlast (2:[1])  (mlast02)
              = mlast (2:1:[])  (sintaxe)
              = mlast (1:[]) (mlast02)
              = 1  (mlast01)
-}

{-
Exercícios: Para cada uma das funções abaixo, as quais estão definidas no prelúdio, 
definir sua própria versão primitiva recursiva e apresentar um exemplo de avaliação no qual ocorra 
pelo menos três chamadas  recursivas. Justicar cada igualdade (redução) da avaliação.

- concatenação (append) de listas (++)
- prefixo da lista (take)
- sufixo da lista (drop)
- parte inicial da lista (init)
- indexação de listas (!!)
- reversão de listas
-}

mcat1::[a] -> [a] ->[a]
-- indução no primeiro argumento
mcat1 []  ys =  ys  -- caso base
mcat1 (x:xs)  ys =  x:(mcat1 xs ys)   -- caso indutivo

{-
   mcat1 [1,2,3] [4,5,6]
   = mcat1 (1:[2,3]) [4,5,6]
   = 1: (mcat1[2,3] [4,5,6])
   = 1:(mcat1 2:[3]) [4,5,6])
   = 1:(2:(mcat1 [3] [4,5,6]))
   = 1:(2:(mcat1 3:[]) [4,5,6]))
   = 1:(2:3:(mcat1 [] [4,5,6])))
   = 1:(2:(3:[4,5,6])))
   = [1,2,3,4,5,6]
-}

{- mcat2::[a] -> [a] ->[a]
-- indução no segundo argumento
mcat2 xs  [] =    -- caso base
mcat2 xs  (y:ys)  =    -- caso indutivo -}

mtake::Integer ->[a] -> [a]
mtake n [] = []
mtake n (x:xs)
   | n == 0 = []
   | n < 0 = []
   | n >0 = x:(mtake (n-1) xs)

mdrop:: Integer -> [a] -> [a]
mdrop n [] = []
mdrop n (x:xs) | n <= 0 = x:xs
			   | n > 0 = mdrop (n-1) xs

minit::[a] -> [a]
--requer lista não vazia
minit (x:[]) = []
minit (x:y:xs) = x : minit (y:xs)

mindex::[a] -> Integer -> a 
mindex [] n 
      | n < 0 = error "negative index"
      | otherwise = error "index to large"
mindex (x:xs) n 
      | n < 0 = error "negative index"
      | n == 0 = x 
      | otherwise = mindex xs (n - 1)       

mReverse::[a]->[a]
mReverse [] = []  
mReverse (x:xs)= mReverse xs ++ [x]