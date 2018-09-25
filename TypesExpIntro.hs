module TypesExpIntro where

import Data.Char (ord,chr)
 
{- Seção: Haskell Script
 Um programa  Haskell consiste em uma sequência de definições.
 Uma definição associa um nome a um valor de um tipo específico
 
 name::type
 name = exp
-}

{-  Seção Tipos Primitivos: Bool,Integer,Int, Float, Char, String
-}

{-
  Tipo Bool é formado somente pelas constantes True e False else
  equipado com as funções booleanas tradicionais:
  
  &&:: Bool -> (Bool -> Bool) (conjunção)
  ||:: Bool -> (Bool -> Bool) (disjunção)
  not:: Bool -> Bool (negação)
  relações sobre ordens: ==, <,<=,>,>=,/=
-}

bool1 = True && False 
bool2 = (&&) True True 
bool3 = not True || False 
bool4 = 4 < 3 
bool5 = 2 /= 2
bool6 = True && False 

size::Int  
-- inteiros limitados em complemento de 2
size = 12

size'::Integer
-- inteiros ilimitados
size'= 2^20

char::Char
char = 'a'

asc_a = ord char
char_a = chr asc_a

message::String 
message = "Hello World!"

 

{-
  Seção: Definição de Funções 
  - f::x -> y "f recebe argumentos do tipo x e retorna resultados 
   do tipo y"
  - x  é chamado tipo domínio e y o tipo Codomínio.
  - (->) é um construtor de tipo para funções. 
  -  a -> b representa o tipo de todas as funções de a para b, onde
     a e b são tipos.
  - Funções são em geral funções parciais, pois podem não estar definidas para
  - todos os valores. Funções que estão definidas para todos os valores dos
  - tipo domínio são chamadas de funções totais.
-}

sqr:: Int -> Int
sqr x = x*x

times4::Int -> Int 
times4 x = double(double x)

-- versão anônima 
afour:: Int->Int
afour x =    double(double x)

double:: Int -> Int 
double n = 2*n

-- aqui os dois primeiros tipos representam
-- o tipo dos argumentos. 
add:: Int -> Int -> Int 
add m n = m + n -- os argumentos m e n são separados por espaços

silly_sum::(Int,Int)-> Int 
silly_sum(x, y) = x+y

msign::Int -> Int

-- Funões definidas por casos
-- com o condicional
msign x = if x>0 then 1
           else if x==0 then 0
                else -1
                
msign'::Int -> Int 

-- Funções definidas por casos
-- com equações guardadas (por expressões booleanas)
msign' x | x > 0  = 1
msign' x | x == 0 = 0 
msign' x | x < 0 = -1

-- Forma abreviada da solução acima.
msign'' x | x > 0  = 1
          | x == 0 = 0 
          | x < 0 = -1
{-
  Funções sobre Booleans
-}

-- com o condicional
mand:: Bool -> Bool -> Bool
mand b c = if b then c else False 

-- por indução em Bool
mand':: Bool -> Bool -> Bool
mand' True b = b 
mand' False b = False

-- com equações guardadas 
mand'':: Bool -> Bool -> Bool
mand'' b c | b == True = c
           | otherwise = False
           
{-
  Exercício: Definir suas próprias versões dos outros operadores 
  booleanos utilizando as três técnicas apresentadas acima: mor, mnot,
  mimp,meqv, mnor, mand, mxor.
-}

mor:: Bool -> Bool -> Bool
mor b c | b == True = True
        | otherwise = c

mor':: Bool -> Bool -> Bool
mor' b c = if b then True else b

mnot:: Bool -> Bool
mnot b | b == False = True
       | otherwise = False

mnot' :: Bool -> Bool
mnot' b = if b then False else True

mimp:: Bool -> Bool -> Bool
mimp b c | b == True = True
         | b == False = not b

mimp':: Bool -> Bool -> Bool
mimp' b c = if b then True else not b

mimp'':: Bool -> Bool -> Bool
mimp'' b True = True
mimp'' b False = not b 


meqv:: Bool -> Bool -> Bool
meqv b c | b == True = c
         | b == False = not c
 

{-
   Seção: Abstrações com let e where 
-}

sum_sqr::(Float,Float) -> Float
-- requer True
-- garante sum_sqr = x^2 + y^2
sum_sqr(x,y) = let t1 = x*x 
                   t2 = y*y 
               in t1+t2 
          
sum_sqr'::(Float,Float)-> Float 
sum_sqr'(x,y)= t1 + t2 where
    t1 = x*x 
    t2 = y*y 
    
{-
   Definir uma função que recebe os coeficientes de um polinômio
   de segundo grau e retorna a tupla de valores que resolvem
   a expressão, i.e., o valores que zeram o polinômio.
   
   Sugestão: solveQuadrEq::(Float,Float,Float)->(Float,Float)
-}
 





{-
 Abreviações de Tipo: Utilizadas para melhorar a legibilidade dos programas. 
 Não acrescentam nada a portabilidade dos programas.
-}

 
{-
   Seção: Funções Parciais
-}

bottom:: a
bottom = error "Função não-definida. Observar pré-condição"

msqrt::Float -> Float 
-- requer x >= 0 
-- garante msqrt = raiz quadrada de x 
msqrt x | x>=0 = sqrt x 
        | otherwise = bottom 

-- undefined é pré-definido no Prelúdio.
msqrt'::Float -> Float 
-- requer x >= 0 
-- garante msqrt = raiz quadrada de x 
msqrt' x | x>=0 = sqrt x 
         | otherwise = undefined  -- undefined is pré-definida em Haskell      
