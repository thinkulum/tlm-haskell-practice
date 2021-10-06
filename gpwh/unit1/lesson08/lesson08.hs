-- Consider this
drop' n aList = if n == length aList
                then []
                else (aList !! n) : drop' (n + 1) aList

-- QC 8.1
myLength' [] = 0
myLength' (x:xs) = 1 + myLength' xs

-- Q8.1
reverse' [] = []
reverse' [x] = [x]
reverse' (x:xs) = reverse' xs ++ [x]

-- Q8.2
fib 0 = 0
fib 1 = 1
fib n = fib (n-1) + fib (n-2)

fastFib n1 n2 1 = n1
fastFib n1 n2 counter = fastFib n2 (n1 + n2) (counter - 1)

-- Kurt's answer
fastFib' _ _ 0 = 0
fastFib' _ _ 1 = 1
fastFib' _ _ 2 = 1
fastFib' x y 3 = x + y
fastFib' x y c = fastFib' (x + y) x (c - 1)