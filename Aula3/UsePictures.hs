module UsePictures where
{-
-- Contexto: Livro Craft
-- Para mostrar uma picture 'pic', use a função 'render' e deixe aberto em um browser 
-- o arquivo refresh.html
-- exemplo : 'render horse', 'render (horse `beside` (flipV horse))
-- Ativdades:
1) Ler seção 1.3 e 1.6, 1.13 (até o início da seção Pictures and Lists) e 
experimentar com os exemplos
2) Resolver os exercícios: 2.2, 2.3, 2.4
3) Ler a seção 4.2 (até o início da seção 'Calculations with local definitions')
4) Resolver os exercícios: 4.5, 4.6
5) Ler seção 4.6 e resolver os exercícios: 4.25-4.30
-}

import PicturesSVG

-- Inverting the colour of the horse picture, ...

blackHorse :: Picture
blackHorse = invertColour horse

-- ... rotating the horse picture, ...

rotateHorse :: Picture
rotateHorse = flipH (flipV horse)

-- ... to rotate a picture we can perform the two reflections,
-- and so we define

rotate :: Picture -> Picture
rotate pic = flipH (flipV pic)

-- A different definition of rotateHorse can use rotate

rotateHorse1 :: Picture
rotateHorse1 = rotate horse

-- where the new definition is of a different name: you can't change a definition
-- in a script.

-- Defining rotate a different way, as a composition of functions; see the
-- diagram in the book for a picture of what's going on.

rotate1 :: Picture -> Picture
rotate1 pic = flipH (flipV pic)

{- Resolver os seguintes exercícios do livro Haskell Craft:

2.2, 2.3, 2.4,

- Redefina a função fourPics abaixo utilizando as construções let and where:
-}

fourPics::Picture -> Picture 
fourPics pic = 
	 (pic `above` invertColour pic)
	     `beside`
	  (invertColour . flipV)(pic `above` invertColour pic)

page55::IO()
page55 = render (fourPics horse)

{-
   Primeiramente ler a seção 4.6 do livro e após resolver os seguintes exercícios:

4.25, 4.26, 4.27, 4.28, 4.29, 4.30.
-}
