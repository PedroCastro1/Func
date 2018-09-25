-------------------------------------------------------------------------
--  
--     Store.hs
--  
--         An abstract data type of stores of integers, implemented as
--         a list of pairs of variables and values.         
--                                  
--         (c) Addison-Wesley, 1996-2011.                   
--  
-------------------------------------------------------------------------

module Store 
   ( Store, 
     initial,     -- Store
     value,       -- Store -> indexT-> valueT
     update       -- Store -> indexT-> valueT -> Store
    ) where

-- indexT is the type of variables.                    
-- valueT is the type of store values

data Store indexT valueT = Store [ (indexT,valueT) ] 

instance (Eq indexT, Eq valueT) =>
         Eq (Store indexT valueT) where 
  (Store sto1) == (Store sto2) = (sto1 == sto2)                 

instance (Show indexT, Show valueT) =>
     Show (Store indexT valueT) where
  show (Store sto) = show sto                 
--  
initial :: Store indexT valueT

initial = Store []

value  :: (Eq indexT, Num valueT) => Store indexT valueT 
           -> indexT -> valueT

value (Store []) v         = 0
value (Store ((w,n):sto)) v 
  | v==w            = n
  | otherwise       = value (Store sto) v

update  :: Store indexT valueT -> indexT -> valueT -> 
           Store indexT valueT

update (Store sto) v n = Store ((v,n):sto)

