module Queue 
( Queue,
  emptyQ, -- Queue a
  isEmptyQ, -- Queue a -> Bool
  addQ, -- a -> Queue a -> Queue a
  remQ -- Queue a -> (a , Queue a)
) where

q1 = Queue [1,2,3]

newtype Queue a = Queue [a]
        deriving (Show)

emptyQ:: Queue a
emptyQ = Queue []

isEmptyQ:: Queue a -> Bool
isEmptyQ (Queue []) = True
isEmptyQ _ = False

addQ:: a -> Queue a -> Queue a
addQ x (Queue xs) = Queue (xs ++ [x])

remQ:: Queue a -> (a, Queue a)
remQ q@(Queue xs) -- @ "as"
     | not (isEmptyQ q) = (head xs, Queue (tail xs))
     | otherwise = error "remQ"
