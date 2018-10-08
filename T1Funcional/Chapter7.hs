module Chapter7 where


-- Primitive recursion exercises

myHead:: [a] -> a
myHead (x:_) = x

myTail:: [a] -> [a]
myTail(_:xs) = xs

firstIntegerPlus:: [Int] -> Int
firstIntegerPlus (x:_) = x + 1

firstTwoIntegers:: [Int] -> Int
firstTwoIntegers (x:xs)
               = case (x:xs) of
                 []     -> 0
                 (x:[]) -> x
                 (x:xs) -> x + (myHead xs)

firstTwoIntegers':: [Int] -> Int
firstTwoIntegers' (x:xs)
              | null (x:xs) = 0
              | len > 0 = x + myHead(xs)
              | len == 1 = myHead(xs)
              where 
                len = length (x:xs)


mySum:: [Int] -> Int 
mySum (x:xs) = x + sum xs

myProduct:: [Int] -> Int
myProduct (x:xs) = x * product xs

myConcat:: [[a]] -> [a]
myConcat [] = []
myConcat (x:xs) = x ++ concat xs

myConcat':: [a] -> [a] -> [a]
myConcat' [] ys = ys
myConcat' (x:xs) ys = x:(xs++ys)

myElem:: Integer -> [Integer] -> Bool
myElem n [] = False
myElem n (x:xs) = (n == x) || (elem n xs)

doubleAll:: [Integer] -> [Integer]
doubleAll [] = []
doubleAll (x:xs) = 2 * x : doubleAll xs

isEven:: Integer -> Bool 
isEven x 
      | x `mod` 2 == 0 = True
      | otherwise = False

selectEven:: [Integer] -> [Integer]
selectEven [] = []
selectEven (x:xs)
            | isEven x = x : selectEven xs
            | otherwise = selectEven xs

iSort:: [Integer] -> [Integer]
iSort [] = []
iSort (x:xs) = ins x (iSort xs)

ins:: Integer -> [Integer] -> [Integer]
ins x [] = [x]
ins x (y:ys)
      | x <= y = x:(y:ys)
      | otherwise = y : ins x ys


elemNum:: Integer -> [Integer] -> Integer
elemNum n [] = 0
elemNum n (x:xs) 
          | n == x = 1 + elemNum n xs
          | otherwise = elemNum n xs

{- Terminar list comprehensions
elemNum':: Integer -> [Integer] -> Integer
elemNum' n xs 
-}

-- Analisar
unique:: [Integer] -> [Integer]
unique []  = []
unique (x:xs) 
        | xs /= stripped = unique stripped
        | otherwise = x : unique stripped
        where 
          stripped = [y | y <- xs, y /= x]

myTake:: Int -> [a] -> [a]
myTake 0 _ = []
myTake _ [] = []
myTake n (x:xs) 
        | n >= 0 = x : take(n-1) xs
