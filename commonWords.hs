module CommonWords where

import Data.Char(toLower)
import Sorting

type Text = String

sortWords::[String] -> [String]
sortWords = quickSort

countRuns::[String] -> [(Int,String)]
countRuns [] = []
countRuns (x:xs) = 
    let prefix = takeWhile (x==) (x:xs)
        sufix = dropWhile (x==) (x:xs)
    in (length prefix, x):countRuns sufix

sortRuns::[(Int, String)] -> [(Int, String)]
sortRuns = reverse . quickSort

showRun::(Int, String) -> String
showRun (i,w) = w ++ " " ++ show i ++ "\n"

commonWords:: Int -> Text -> String
commonWords n = 
      concat . map showRun . take n .
      sortRuns . countRuns . sortWords .
      words . map toLower

main = do      
    putStrLn "Nome do arquivo de entrada:"
    inFile <- getLine
    putStrLn "Quantidade de palavras:"
    n <- getLine
    putStrLn "Nome do Arquivo de Saída"
    outFile <- getLine
    text <- readFile inFile
    writeFile outFile (commonWords (read n) text)
      
