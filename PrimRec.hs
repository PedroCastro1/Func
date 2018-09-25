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
 - Função de potenciação, onde a potência é um inteiro positivo.
 - 1 + 3 + 5 + ... + k (duas versões: recursiva e através da forma fechada)
 - 1^2 + 2^2 + 3^2 + ... + k^2 (duas versões: recursiva e através da forma fechada)
 These ones are more difficult
  - Fundção de divisão inteira (inteiros positivos).
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

- concatenação de listas
- prefixo da lista (take)
- sufixo da lista (drop)
- parte inicial da lista (init)
- indexação de listas (!!)
- reversão de listas
-}

mcat:: [a] -> [a] -> [a]
-- Indução primeiro argumento
mcat []  ys = ys  -- Caso base
mcat (x:xs) ys = x:mcat xs ys -- Caso indutivo

mtake::Integer -> [a] -> [a]
mtake n [] = []
mtake n (x:xs)
  | n <= 0 = []
  | n > 0 = x:(mtake(n-1) xs)
   
{-mdrop::Integer -> [a] -> [a]
mdrop n [] = []
mdrop n (x:xs)
  | n < 0 = x:xs
  | n == 0 = x:xs
  | n > 0 = mdrop(n-1) xs
-}
{-minit::[a] -> [a]
--Requer lista não vazia
minit (x:[]) = x
minit (x:y:xs) = x : minit(y:xs)
-}
mindex::[a] -> Integer -> a
--Requer uma lista não vazia
mindex [] n 
  | n <= 0 = error "Negative index"
  | otherwise = error "Index too large"
mindex (x:xs) n 
  | n < 0 = error "Negative index"
  | n == 0 = x
  | otherwise = mindex xs (n-1)

mrev::[a] -> [a]
mrev [] = []
mrev (x:xs) = mrev xs ++ [x]

{-
  Exercícios adicionais: Livros Craft
    Capítulos 3 - 3.13, 3.14, 3.16, 3.18, 3.19, 3.20, 3.21, 3.22, 3.23, 3.24 

      Capítulos 4 - 4.1, 4.2, 4.3, 4.4, 4.17, 4.18, 4.19, 4.20, 4.21, 4.22, 4.23, 4.31, 4.32
-}

    
