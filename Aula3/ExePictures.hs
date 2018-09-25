module ExerPictures where

import PicturesSVG
import UsePictures

exer2_3::Picture
exer2_3 = (horse `above` blackHorse) `beside` (blackHorse `above` horse)

exer2_4::Picture
exer2_4 = (horse `above` flipH(blackHorse)) `beside` (blackHorse `above`flipH(horse))

exer4_5::Picture -> Picture
exer4_5 pic =  
  let invPic = invertColour pic
      left = (pic `above` invPic)
      right = invertColour (flipV(left)) --(invertColour . flipV) (pic `above` invertColour pic) 
  in left `beside` right

exer4_6::Picture -> Picture
exer4_6 pic = 
    top `above` bottom
      where
        top = pic `beside` flipV(invertColour pic) 
        bottom = invertColour(pic) `beside` flipV pic

blackWhite::Integer -> Picture
blackWhite n
  | n <= 1 = black 
  | otherwise = black `beside` whiteBlack (n-1)

whiteBlack::Integer -> Picture 
whiteBlack n
  | n <= 1 = white
  | otherwise = white `beside` blackWhite(n-1)

whiteChess:: Integer -> Integer -> Picture 
whiteChess n m
  | n <= 1 = whiteBlack m
  | otherwise = whiteBlack m `above` blackChess(n-1) m

blackChess::Integer -> Integer -> Picture
blackChess n m
  | n <= 1 = blackWhite m
  | otherwise = blackWhite m `above` whiteChess(n-1) m

column:: Picture -> Integer -> Picture
column pic n
  | n <= 1 = pic
  | otherwise = pic `above`(column pic (n-1)) 
