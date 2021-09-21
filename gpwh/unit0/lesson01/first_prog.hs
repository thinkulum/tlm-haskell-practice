main :: IO()
main = do
    print "Who is the email for?"
    recipient <-getLine 
    print "What is the Title?"
    title <- getLine
    print "Who is the Author?"
    author <- getLine
    print (createEmail recipient title author)

toPart recipient = "Hey " ++ recipient ++ ",\n"
bodyPart bookTitle = "It was really nice of you to buy " ++ bookTitle ++ ".\n"
fromPart author = "You're the best,\n" ++ author

createEmail recipient bookTitle author = toPart recipient ++
                                         bodyPart bookTitle ++
                                         fromPart author