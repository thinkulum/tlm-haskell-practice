-- QC 11.1
halve :: Int -> Int
halve n = n `div` 2

-- QC 11.2
printDouble :: Int -> String
printDouble n = show (n * 2)

-- QC 11.3
makeAddressLambda :: Integer -> String -> String -> (Integer, String, String)
makeAddressLambda = (\number ->
                        (\street ->
                            (\town -> (number, street, town))))

makeAddress :: Integer -> String -> String -> (Integer, String, String)
makeAddress number street town = (number, street, town)
makeAddress1 :: String -> String -> (Integer, String, String)
makeAddress1 = undefined
makeAddress2 :: String -> (Integer, String, String)
makeAddress2 = undefined

-- QC 11.4
-- The type signature for map can't be map :: (a -> a) -> [a] -> [a] 
-- because the return value can have a different type from the list type 
-- depending on the function argument.
myMap :: (Integer -> String) -> [Integer] -> [String]
myMap = map
myMapResult = myMap show [1,2,3,4]

-- Q11.1
filter :: (a -> a) -> [a] -> [a]
-- Should be ... (a -> Bool) ...
-- filter returns a list of the same type as the input list, whereas map's result type can be different.
filter = undefined

-- Q11.2
empty = []
head' :: [a] -> a
head' xs = head xs
tail' :: [a] -> [a]
tail' xs = tail xs
head'' :: [a] -> [a]
head'' [] = []
-- This doesn't match the type signature that allows for a result of []:
-- head'' (x:xs) = x

-- Q11.3
myFoldl :: (a -> a -> a) -> a -> [a] -> a
-- Kurt has myFoldl :: (a -> b -> a) -> a -> [b] -> a
myFoldl f init [] = init
myFoldl f init (x:xs) = myFoldl f newInit xs
  where newInit = f init x
