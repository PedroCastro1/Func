module FunStore
( Store,
  initial,
  update,
  value
) where

data Store a = Sto (a -> Integer)

initial:: Store a
initial = Sto (\x -> 0)

value::(Eq a) =>  Store a -> a -> Integer
value (Sto sto) v = sto v

update::(Eq a) => Store a -> a -> Integer -> Store a
update (Sto sto) v n
        = Sto (\x -> if v == w then n else sto x)
