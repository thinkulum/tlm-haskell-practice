module Ch03 where

-- Chapter exercises
-- Building functions
-- 2.
string2 :: String
string2 = "Hello, world"
addExclamation :: String -> String
addExclamation x = x ++ "!"
fifthItem :: String -> Char
fifthItem x = x !! 4
dropNine :: String -> String
dropNine x = drop 9 x

-- 5.
string5 :: String
string5 = "Curry is awesome"
rvrs :: String -> String
rvrs x = concat [third, second, first]
    where first = take 5 x
          third = drop 9 x
          second = take 4 (drop 5 x)
