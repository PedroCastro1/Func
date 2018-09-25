module CalcStore where 

import Store

data VExp = L Int | V String | VExp :+: VExp | VExp :-: VExp 
          | VExp :*: VExp
             deriving (Show)

vexp02 = (V "x" :*: V "y") :+: (L 5)

type Mem = Store String Int

initM = initial 
mem01::Mem
mem01 = 
	 update (update 
	 	 (update initial "x" 10) "y" 5) "z" (-12)

eVExp:: VExp -> Mem -> Int 
eVExp (L k) m  = k 
eVExp (V s) m = value m s 
eVExp (e1 :+: e2) m = eVExp e1 m + eVExp e2 m 
eVExp (e1 :*: e2) m = eVExp e1 m * eVExp e2 m
eVExp (e1 :-: e2) m = eVExp e1 m - eVExp e2 m