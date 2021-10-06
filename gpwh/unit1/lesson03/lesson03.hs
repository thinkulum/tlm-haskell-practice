-- Quick check 3.2
-- Q1
doubleDouble x = dubs * 2
    where dubs = x * 2

doubleDouble' x = (\dubs -> dubs * 2) (x * 2)

doubleDouble'' x = let dubs = x * 2
                   in
                       dubs * 2

-- Quick check 3.3
overwrite x = let x = 2
              in
                  let x = 3
                  in
                      let x = 4
                      in
                          x

overwrite' x = (\x -> (\x -> (\x -> x) 4) 3) 2

-- Q3.1
sumSquareOrSquareSum x y = (\sumSquare squareSum ->
                                if sumSquare > squareSum
                                then sumSquare
                                else squareSum) (x ^ 2 + y ^ 2) ((x + y) ^ 2)
sumSquareOrSquareSum' = \x y -> (\sumSquare squareSum ->
                                if sumSquare > squareSum
                                then sumSquare
                                else squareSum) (x ^ 2 + y ^ 2) ((x + y) ^ 2)

doubleDouble''' = \x -> (\dubs -> dubs * 2) (x * 2)

x = 4

add1 y = y + x
add1' = \y -> y + x

add2 y = (\x -> y + x) 3
add2' = \y -> (\x -> y + x) 3

add3 y = (\y ->
            (\x -> y + x) 1) 2
add3' = \y -> (\y ->
            (\x -> y + x) 1) 2

-- Q3.2
counter x = let x = x + 1
            in
                let x = x + 1
                in
                    x
counter' x = (\x -> 
                (\x -> 
                    x
                ) (x + 1)
            ) (x + 1)
counterKurt x = (\x -> x + 1) (
                (\x -> x + 1) (
                    (\x -> x) x))
counterKurtWithLet x = let x = (let x = (let x = x in x) in x + 1) in x + 1
