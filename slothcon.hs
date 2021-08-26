--- 1.1.1  Haskell has arithmetic operators: +, *, -, /.
aDifference = 4 - 5

--- 1.1.2  Use parentheses to specify order of operations.
aResult = (1 + 3) * 7

--- 1.1.3  Use parentheses for negative numbers.
anotherDifference = 8 + (-4)

--- 1.1.4  Haskell has Boolean values (True, False) and operators: &&, ||, not, ==, /=.
aTruth = True && not False

--- 1.1.5  + expects numeric arguments.
aSum = 4 + 5

--- 1.1.6  == expects arguments of the same type.
anEquality = "twelve" == "twelve"

--- 1.2.1  Some functions are infix, such as *.
aProduct = 3 * 9

--- 1.2.2  Prefix functions are called using the name and then parameters, all space separated.
aSucc = succ 1

--- 1.2.3  succ returns its parameter's successor.
anotherSucc = succ 2

--- 1.2.4  min returns the smaller of two values.
aMin = min 4 27

--- 1.2.5  max returns the larger of two values.
aMax = max 18739482 3

--- 1.2.6  Function application has the highest precedence.
anotherResult = min 8 2 * 4

--- 1.2.7  Prefix functions can be called as infix using backticks.
anIntegralQuotient = 14 `div` 3

--- 1.2.8  div executes integral division.
anotherIntegralQuotient = div 9 2
