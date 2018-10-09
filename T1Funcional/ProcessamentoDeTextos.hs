module ProcessamentoDeTextos where

import Data.Char

whitespaces = ['\n', '\t', ' ']

getWord:: String -> String
getWord [] = []
getWord (x:xs)
        | x `elem` whitespaces = []
        | otherwise = x :getWord xs

dropWord:: String -> String
dropWord [] = []
dropWord (x:xs)
        | x `elem` whitespaces = (x:xs)
        | otherwise = dropWord xs

dropSpaces:: String -> String
dropSpaces [] = []
dropSpaces (x:xs)
          | x `elem` whitespaces = dropSpaces xs
          | otherwise = (x:xs)

type Words = String

splitWords:: String -> [Words]
splitWords st = split (dropSpaces st)

split:: String -> [Words]
split [] = []
split st = (getWord st) : split (dropSpaces (dropWord st))

type Line = [Words]

myGetLine:: Int -> [Words] -> Line
myGetLine len [] = []
myGetLine len (x:xs)
          | length x <= len = x : restOfLine
          | otherwise = []
          where
            newLen = len - (length x + 1)
            restOfLine = myGetLine newLen xs

dropLine:: Int -> [Word] -> Line
dropLine 0 _ = []
dropLine _ [] = []
dropLine len (x:xs)

toLowerAndFilter = filter (`elem` ['a'..'z']) . map toLower

isPalindrome:: String -> Bool
isPalindrome str
            | toLowerAndFilter str == toLowerAndFilter (myReverse str) = True
            | otherwise = False


myReverse:: [a]-> [a]
myReverse [] = []
myReverse (x:xs) = myReverse xs ++ [x]
