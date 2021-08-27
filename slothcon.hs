--- 1.3.6  Function names can't begin with capital letters.
--- 1.3.3  Functions can call each other.
--- 1.3.7  A function can take no parameters, in which case it's called a definition or name.
--- 1.1.1  Haskell has arithmetic operators: +, *, -, /.
numAudience = numAttendees - numSpeakers
--- 1.3.2  Functions can be defined in any order.
numAttendees = 100
numSpeakers = 10

minSlothLengthInches = 24
maxSlothLengthInches = 31

minSlothWeightPounds = 7.9
maxSlothWeightPounds = 17.0

minThreeToedTailLengthInches = 2.0
maxThreeToedTailLengthInches = 2.4

slothWeightPoundsRoughAverage = roughAverage minSlothWeightPounds maxSlothWeightPounds
--- 1.3.1  A function definition looks like a function call followed by = and the body.
--- 1.1.2  Use parentheses to specify order of operations.
roughAverage minValue maxValue = (minValue + maxValue) / 2

treeBranchWeightCapacityPounds = 100
--- 1.2.8  div executes integral division.
--- 1.2.7  Prefix functions can be called as infix using backticks.
--- TODO: Fix these types.
--- treeBranchWeightCapacitySloths = treeBranchWeightCapacityPounds `div` slothWeightRoughAverage



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


--- 1.3.4  An if statement takes the form: if condition then expression else expression. The else is required.
--- 1.3.5  Apostrophes are legal in names. They're often used to denote strict (non-lazy) or modified versions of functions.
