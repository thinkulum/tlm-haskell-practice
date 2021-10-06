-- QC 7.3
myTail (_:xs) = xs

-- Q7.1
myTail [] = []

-- Q7.2
myGCD a b = if remainder == 0
            then b
            else myGCD b remainder
  where remainder = a `mod` b
getRemainder a b = a `mod` b
myGCD' b 0 = b
myGCD' b remainder = myGCD' b (getRemainder b remainder)
