-- Just an experiment to see what a recursive for loop might look like.
-- I'll make a recursive Haskell version of this JavaScript:
-- var j = 0;
-- for (var i = 0; i < 10; i++) {
--     j += 1;
-- }
for' 9 j = j + 1
for' i j = for (i + 1) (j + 1)

myJ = for' 0 0

-- Generalize:
-- for endCond inc loopBody = if endCond == True then loopBody else ...