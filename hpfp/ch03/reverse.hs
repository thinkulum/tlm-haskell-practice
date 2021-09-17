-- reverse.hs
-- Chapter exercises
-- Building functions
-- 6.
module Reverse where

string6 :: String
string6 = "Curry is awesome"
rvrs :: String -> String
rvrs x = concat [third, second, first]
    where first = take 5 x
          third = drop 9 x
          second = take 4 (drop 5 x)

main :: IO ()
main = print $ rvrs string6
