-- Q6.1
repeat' x = cycle [x]
tryRepeat = take 10 (repeat' 'a')

-- Q6.2
subseq start end aList = take (end - start) (drop start aList)
trySubseq = subseq 2 5 [1 .. 10]

-- Q6.3
inFirstHalf el aList = if el `elem` take (length aList `div` 2) aList
                       then True
                       else False
tryInFirstHalfTrue = inFirstHalf 'e' "qwertyuiop"
tryInFirstHalfFalse = inFirstHalf 'o' "qwertyuiop"
