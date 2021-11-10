-- QC 13.3
data Icecream = Chocolate | Vanilla deriving (Show, Eq, Ord)

-- Q13.2
inc :: Int -> Int
inc x = x + 1

-- Q13.3
cycleSucc :: (Bounded a, Enum a, Ord a) => a -> a
cycleSucc n = if n == maxBound
    then minBound
    else cycleSucc (succ n)
