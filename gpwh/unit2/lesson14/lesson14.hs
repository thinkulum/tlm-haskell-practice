data SixSidedDie = S1 | S2 | S3 | S4 | S5 | S6
-- QC 14.1
instance Show SixSidedDie where
   show S1 = "I"
   show S2 = "II"
   show S3 = "III"
   show S4 = "IV"
   show S5 = "V"
   show S6 = "VI"

instance Eq SixSidedDie where
   (==) S6 S6 = True
   (==) S5 S5 = True
   (==) S4 S4 = True
   (==) S3 S3 = True
   (==) S2 S2 = True
   (==) S1 S1 = True
   (==) _ _ = False

-- QC 14.3
instance Ord SixSidedDie where
   compare S6 S6 = EQ
   compare S6 _ = GT
   compare _ S6 = LT
   compare S5 S5 = EQ
   compare S5 _ = GT
   compare _ S5 = LT
   compare S4 S4 = EQ
   compare S4 _ = GT
   compare _ S4 = LT

-- QC 14.4
data SixSidedDie' = S1' | S2' | S3' | S4' | S5' | S6' deriving (Show, Eq, Ord)

-- Q14.1
data SixSidedDie'' = S1'' | S2'' | S3'' | S4'' | S5'' | S6'' deriving (Enum)
instance Eq SixSidedDie'' where
    (==) x y = fromEnum x == fromEnum y
instance Ord SixSidedDie'' where
    compare x y = compare (fromEnum x) (fromEnum y)

-- Q14.2
-- Define a five-sided die (FiveSidedDie type).
data FiveSidedDie = FS1 | FS2 | FS3 | FS4 | FS5 deriving (Show, Eq, Ord, Enum)
-- Then define a type class named Die and at least one method that would be useful to have for a die.
-- Also include superclasses you think make sense for a die.
class Enum a => Die a where
    add :: a -> a -> Int
-- Finally, make your FiveSidedDie an instance of Die.
instance Die FiveSidedDie where
    add x y = fromEnum x + 1 + fromEnum y + 1
