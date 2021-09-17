module Ch04 where

-- 4.3
data Mood = Blah | Woot deriving Show
changeMood :: Mood -> Mood
changeMood Blah = Woot
changeMood    _ = Blah

-- Chapter exercises
-- Correcting syntax
-- 1.
x = (x)

f xs = w `x` 1
    where w = length xs

-- 2.
id' x = x
