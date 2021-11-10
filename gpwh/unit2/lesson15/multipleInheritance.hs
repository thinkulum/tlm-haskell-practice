-- Just a little side experiment: What happens when names clash in multiple inheritance?

class Greeting a where
    hello :: a -> String

-- I don't even get as far as the inheritance.
-- This definition gives an error: Multiple declarations of 'hello'.
class Protocol a where
    hello :: a -> [Int]

class (Greeting a, Protocol a) => Greeter a where
    bye :: a -> String
