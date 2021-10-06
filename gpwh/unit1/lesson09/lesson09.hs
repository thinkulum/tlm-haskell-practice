-- QC 9.1
remove test [] = []
remove test (x:xs) = if test x
                    then remove test xs
                    else x:remove test xs

-- QC 9.2
myProduct (x:xs) = foldl (*) x xs

-- Q9.1
elem' y xs = length (filter f xs) > 0
    where f x = y == x

-- Q9.2
isPalindrome' s = normalized == reverse normalized
    where   normalized = normal s
            normal s = map lower (filter isNonspace s)
            isNonspace c = c /= ' '
            lower c = if c `elem` upperChars
                    then correspond c
                    else c
            upperChars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
            lowerChars = "abcdefghijklmnopqrstuvwxyz"
            allChars = upperChars ++ lowerChars
            correspond c = dropped allChars c !! 26
            dropped (x:xs) c = if x == c
                                then x:xs
                                else dropped xs c

-- Q9.3
harmonic n = foldl (+) 0 (map (1 /) [1 .. n])
