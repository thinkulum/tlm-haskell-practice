{-# Language NoMonomorphismRestriction #-}

module Ch05 where

-- Parametricity
-- 1.
-- sameType :: a -> a
-- sameType (x :: Int) = x + 1
-- sameType x = x

-- 2.
threeVariables :: a -> a -> a
threeVariables x y = x
threeVariables' :: a -> a -> a
threeVariables' x y = y

-- Determine the type
-- 1.
resultA = (* 9) 6
resultB = head [(0, "doge"),(1, "kitteh")] -- Why not (Num, String) or (Num a, String b) => (a, b)?
resultC = head [(0 :: Integer, "doge"), (1, "kitteh")]
resultD = if False then True else False
resultE = length [1, 2, 3, 4, 5]
resultF = (length [1, 2, 3, 4]) > (length "TACOCAT")

-- Does it compile?
-- 1.
bigNum x = (^) 5 $ x
wahoo = bigNum $ 10

-- Write a type signature
-- 1.
functionH :: [a] -> a
functionH (x:_) = x

-- Given a type, write the function
-- Example
myFunc :: (x -> y)
       -> (y -> z)
       -> c
       -> (a, x)
       -> (a, z)
myFunc xToY yToZ _ (a, x) = (a, yToZ (xToY x))

-- 1.
i :: a -> a
i x = x

-- 2.
c :: a -> b -> a
c x y = x

-- Fix it
-- 1.
-- module Sing where

fstString :: [Char] -> [Char]
fstString x = x ++ " in the rain"

sndString :: [Char] -> [Char]
sndString x = x ++ " over the rainbow"

sing = if x > y then
            fstString x 
            else sndString y
        where x = "Singin"
              y = "Somewhere"

-- Type-Kwon-Do
-- 1.
f :: Int -> String
f = undefined

g :: String -> Char
g = undefined

h :: Int -> Char
h x = g (f x)
