-- QC 5.1
genIfXEven x = (\f -> ifEven f x)
ifEven f x = if x `mod` 2 == 0
             then f x
             else x

-- QC 5.2
genResourceRequestBuilder apiBuilder resource = (\id -> apiBuilder resource id)
genApiRequestBuilder hostBuilder apiKey resource = (\id -> hostBuilder apiKey resource id)

-- QC 5.3
getRequestUrl host apiKey resource id = host ++
                                        "/" ++
                                        resource ++
                                        "/" ++
                                        id ++
                                        "?token=" ++
                                        apiKey
myExampleBookUrlBuilder = getRequestUrl "http://example.com" "1337hAsk3ll" "book"

-- QC 5.4
subtract2 = flip (-) 2

-- Q5.1
inc n = n + 1
double n = n*2
square n = n^2
ifEvenInc = ifEven inc
ifEvenDouble = ifEven double
ifEvenSquare = ifEven square

-- Q5.2
binaryPartialApplication binaryFunction x = (\y -> binaryFunction x y)
