-- practice.hs
module Mult1 where

mult1 = x * y
    where x = 5
          y = 6

-- 2.10
-- 1.
ex1 = x * 3 + y
    where x = 3
          y = 1000

-- 2.
ex2 = xippy * 5
    where y = 10
          xippy = 10 * 5 + y

-- Chapter exercises
-- More fun with functions
-- 4.
wax0n = x * 5
    where x = y ^ 2
          y = z + 8
          z = 7

-- 5.
triple x = x * 3

-- 6.
wax0ff x = triple x
