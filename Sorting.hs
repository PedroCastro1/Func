module Sorting where


ins:: Ord a => a -> [a] -> [a]
ins x [] = [x]
ins x (y:ys) = if x <= y then x:y:ys
               else y:(ins x ys)

inSort:: Ord a => [a] -> [a]                
inSort [] = []
inSort (x:xs) = ins x (inSort xs)

quickSort:: Ord a => [a] -> [a]
quickSort [] = []
quickSort (x:xs) = quickSort [y | y <- xs, y <= x] ++ [x] ++
                   quickSort [y | y <- xs, y > x]

mergeSort:: Ord a => [a] -> [a]
mergeSort [] = []
mergeSort (x:xs) = mergeSort [y | y <- xs, y <= x] ++ [x] ++ 
                   mergeSort [y | y <- xs, y > x]
