module IndTypesNew where 

data MNat = Z | Suc MNat

instance Show MNat where 
   show Z = "Z"
   show (Suc x) = "Suc(" ++ show x ++")"
   
instance Eq MNat where {- better -}
    Z == x = case x of
    	        Z -> True
    	        (Suc k) -> False 
    (Suc x) == y = case y of 
   	                 Z -> False 
   	                 (Suc k) -> (x == k)
    x /= y = not (x==y)
    
instance Ord MNat where 
   Z <= x = True
   (Suc x) <= y = case y of 
                   Z -> False 
                   (Suc k) -> (x <= y)
   x > y = not (x <= y)
   x < y = y > x
   x >= y = not (x < y)
   min x y = if x <= y then x else y
   max x y = if x >= y then x else y 
                   

 
{- data Exp = L Int | Exp :+: Exp | Exp :-: Exp | Exp :*: Exp
        deriving (Show)

exp01 = ((L 10) :*: (L 3)) :-: (L 2)

eExp:: Exp -> Int 
eExp (L k) = k 
eExp (e1 :+: e2) = eExp e1 + eExp e2 
eExp (e1 :*: e2) = eExp e1 * eExp e2 
eExp (e1 :-: e2) = eExp e1 - eExp e2 
-}

{-
Estender o tipo Exp para que ele comporte variáveis. Isto
é, para que você possa digitar expressões da forma:
vexp02 = (V "x" :*: V "y") :+: (L 5)
-}

{-
 Implementar a expressão de avaliação correspondente. Qual
o problema que você encontra? Como resolvê-lo?
-}


data VExp = L Int | V String | VExp :+: VExp | VExp :-: VExp 
          | VExp :*: VExp
             deriving (Show)

vexp02 = (V "x" :*: V "y") :+: (L 5)

type Mem = String -> Int 

mem01::String -> Int 
mem01 "x" = 10 
mem01 "y" = 5
mem01 "z" = -12 
mem01 _ = 0 

mem02:: String -> Int 
mem02 = (\s -> case s of 
                "x" -> 4
                "y"  -> -3 
                "z"  -> 10 
                _ -> 0)

eVExp:: VExp -> Mem -> Int 
eVExp (L k) m  = k 
eVExp (V s) m  = m s 
eVExp (e1 :+: e2) m = eVExp e1 m + eVExp e2 m 
eVExp (e1 :*: e2) m = eVExp e1 m * eVExp e2 m
eVExp (e1 :-: e2) m = eVExp e1 m - eVExp e2 m