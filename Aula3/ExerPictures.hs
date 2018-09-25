module ExerPictures where

import PicturesSVG
import UsePictures

exer2_2::Picture
exer2_2 = (white `above` black) `beside` 
          (black `above`white)

exer2_2_IO = render exer2_2

exer2_4::Picture
exer2_4 = (horse `beside` blackHorse) `above`
		  ((flipH blackHorse) `beside` (flipH horse)) 

exer4_5::Picture -> Picture 
exer4_5 picture = 
		left `beside` right
		where
			invPic = invertColour picture
			left = picture `above` invPic
			right = invertColour (flipV (left))

ex4_5fig1_IO = render (exer4_5 horse)
ex4_5fig2_IO = render (exer4_5 black)

exer4_5'::Picture -> Picture
exer4_5' pic = 
     let invPic = invertColour pic
         left = pic `above` invPic
         right = invertColour (flipV (left))
     in left `beside` right
