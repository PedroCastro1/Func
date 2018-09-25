module HigherOpStd where
{-
  Great Ideas in Programming: 
     - Recursive Data Types
     - Higher Order Operators (funções que recebem
       funções e retornam funções)
     - ...
     - ...
-}
{-
 O material desenvolvido é baseado na minha experiência e
 é apenas uma visão geral sobre Higher Order Programming 
 com Haskell. Após esta visão geral, estudar e resolver os
 exercícios dos capítulos 10 e 11 do livro Haskell Craft.

 Nos exercícios pedidos, use os operadores de alta ordem
 que são apresentados, a não ser que seja pedido de outra
 forma.
-}

{-
Seção Funções Anônimas - Expressões Lambda

Expressões lambda foram inventadas por Alonzo Church nos anos 40-50, sec. XX, para estudar a computabilidade
de funções. Church mostrou que o poder expressivo das expressões lambda é equivalente ao das máquinas
de Turing e outros modelos computacionais. Daí que surge a Tese de Church-Turing.

Tradicionalmente, temos duas formas de especificar uma função:

1) Dando um Nome:

f:Int -> Int 
f(x)= 2*x

2) Focando no mapeamento em si

\x -> x*x (Haskell Notation). Note que não nomeamos a função e desta forma,
podemos definir e usá-la "on the fly". Na expressão \x -> x*x, as duas ocorrências
de x no corpo da função estão amarradas pela declaração "\x". Desta forma, \v, é 
amrrador (binder), da mesma forma que os quantificadores (forall, exists) em Lógica.

Se lexp é uma expressão lambda e x é um argumento, então 
a aplicação de lexp a x é escrita como "lexp x", como em

\x->x*x 4 = x*x[x/4]= 16, onde a expressão

M[x/t] tem a mesma leitura que em Lógica: a substituição
de todas as ocorrências livres de x e M pelo termo t.

Diversos exemplos de expressões lambda aparecem na sequência.


Uma função que recebe um argumento por vez é chamada de "currificada" (em homenagem ao lógico
Haskell Curry). Em programação de alta ordem é comum utilizarmos a forma currificada das funções.
É essencial para a aplicação parcial de uma função, i.e, a aplicação de uma função a parte de 
seus argimentos
Nas liguagens tradicionais e na matemática,  uma função recebe todos argumentos de uma única vez.
Aqui estamos no campo de programação de primeira ordem. Hem Haskell podemos passar de uma forma 
apara outra atraves de duas funções:

curry::((a,b) -> c) -> (a->(b->c))
uncurry::(a->(b->c)) -> ((a,b)->c)

-}

fc::Int -> Int ->Int 
fc x y = x+y 

uf::(Int,Int) ->Int 
uf (x,y) = x+y 

cex1= uncurry(fc)(3,4)
cex2= curry(uf) 3 4


{-
 Seção: map 

 map::(a->b)->[a]->[b]
 map f [x_1,...,xn] = [f(x1),...,f(xn)]
 
-}

{-
 Em map01 temos a aplicação parcial da função de soma. Estas aplicações parciais são 
 chamadas de "seções" em Haskell.
-}

map01 = map (2+) [3,4,5]
map02 = map (\s -> "Hello " ++ s ++"!") ["John","Doe"]
map03 = map (uncurry (+)) [(2,3),(-2,0),(10,13)]

{-
 - Exercício: Definir a sua própria versão de map por recursão
              primitiva.
 - Exercício: Definir uma função que recebe dois inteiros m e n
              e gera a lista [m,m+1,...,n]
 - Exercício: Definir uma função que soma todos valores numéricos
 de uma lista.
 - Exercício: Com o auxílio de map e das duas funções acima, definir
 uma função que soma todas os quadrados do intervalo [m,m+1,...,n]

-}

{-
 [e | x <- xs, Q] = concat(map f xs) where f =\x -> [e|Q]
 
 Exercício: Definir as expressões abaixo utilizando a
 equação acima.
 
 -- [x*x | x<-[1..5],odd x]
 -- [(x,y,z) | x<-bool,y<-bool,z<-bool]
 -- [(a,b)| a<-[1..3],b<-[1..2]]
 -- [(i,j)| i<-[1..4],even i, j<-[i+1..4],odd j]
 -- [(i,j)| i<-[1..4], j<-[i+1..4],even i, odd j]
-}

bool = [True,False]

lcomp07 = concat(map f [1..5]) where f = \x -> [x*x | odd x]

{-
 Seção: filter 
 filter::(a->Bool)->[a]->[a]
 
 filter p xs = [x <- xs | p x]
 
  Exercício: 
  - Defina uma função recursiva para filter.
-}


posDiv::Int -> [Int]
-- requer x > 0
posDiv x =[d| d <- [2..x-1], x `mod` d == 0]

isPrime::Int -> Bool 
isPrime x = x> 1 && null(posDiv x) 
filter01 = filter even [0..10]
filter02 = filter (\x -> isPrime x) [1..100]

{- This example is the real "extreme programming".
  Try to understand it -}
lcomp12 = filter pred (concat(map f [1..4]))
          where 
            pred = \(x,y) -> even x && odd y
            f = \i -> map (pair i) [i+1..4] 
            pair = \i j -> (i,j)

 

filter03 = takeWhile even [0..10]

{-
Composition of functions is also a higher order
function:

(.)::(b->c) -> (a->b)-> (a->c)
g . f = \a -> g(f(a))
-}
filter04 = dropWhile (not . odd) [0..10]

{-
Exercício: Seja f::a -> b, g::c -> d, h:a->c. 
 Definir estas duas funções.
  - cross(f,g)::cross::((a->b),(c->d)) -> (a,c)->(b,d), 
        (x,y) |-> (f x, g y)
  - fork(f,g)::(a->b,a->c) -> a -> (b,c), 
        x |-> (f x, h x)

   
-}

{-
  Exercício: Definir funções recursivas primitivas 
  para takeWhile e dropWhile.
-}



{-
  Seção: Funções para zipagem
  zip::[a]->[b]->[(a,b)]
  unzip::[(a,b)]->([a],[b])
-}

{- 
  produto escalar u v = \Sigma^n_{i=1} u_i * v_i
  Exercício: Definir o produto escalar em Haskell.
-}

{- 

  zip01 = scalar_product [1..5] [6..10] where
          scalar_product =
-}             
{-
  Uma sequência [x_0,...,x_n] é não-decrescente se e somente se
    ALL k:{0,...,n-1}. x_k <= x_{k+1}.
  Exercício: Definir uma função nondec::Ord a => [a]->Bool
  se uma sequência é não-decrescente.
-}


{- zip02 = nondec [0..10]
   zip03 = nondec ([0..5] ++ (reverse [6..10]))
-}

{-
Exercício: Definir funções recursivas para zip e unzip
-}

scProd :: Num a => [a] -> [a] -> a
scProd = \xs ys -> sum(zipWith (*) xs ys)

nonDec::Ord a => [a]->Bool
nonDec = \xs ->  and(zipWith (<=) xs (tail xs))

{-
  Definir recursivamente e não-recursivamente zipWith.
-}

{-
  Seção: Redução de listas (folds)
  
  foldl::(a->b->a)->a->[b]->a
  foldl bop e [x1,...,xn] = (((e bop x1) bop x2) bop ...) bop xn
  
  foldr:: (a->b->b)->b->[a]->b
  foldr bop e [x1,...,xn] = x_1 bop (x2 bop ...(xn bop e))
  
-}

radd::a->[a]->[a]
radd x [] = [x]
radd x (y:ys) = y:(radd x ys)

{- 
  Study the following definitions. Evaluate manually each
  example 
  foldr01 = foldr (:) [] [1..10] 
  foldr02 = foldr (+) 0 [0..10]
  foldr03 = foldr (*) 1 [1..5]
  foldr04 = foldr (++) [] [[0..5],[6..10],[11..15]]
-}
 

{-
   Apresentar definições recursivas primitivas para foldl e foldr.
-}


{-
  Exercício: Utilizando map and filter, reescrever as expressões abaixo
  sem utilizar o construtor de listas por compreensão:
 
 
 -- [x*x | x<-[1..5],odd x]
 -- [(x,y,z) | x<-bool,y<-bool,z<-bool]
 -- [(a,b)| a<-[1..3],b<-[1..2]]
 -- [(i,j)| i<-[1..4],even i, j<-[i+1..4],odd j]
 -- [(i,j)| i<-[1..4], j<-[i+1..4],even i, odd j]
-}
