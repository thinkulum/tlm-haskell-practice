rotN :: (Bounded a, Enum a) => Int -> a -> a
rotN alphabetSize c = toEnum rotation
 where halfAlphabet = alphabetSize `div` 2
       offset = fromEnum c + halfAlphabet
       rotation =  offset `mod` alphabetSize

rotNdecoder :: (Bounded a, Enum a) => Int -> a -> a
rotNdecoder n c = toEnum rotation
 where halfN = n `div` 2
       offset = if even n
                then fromEnum c + halfN
                else 1 + fromEnum c + halfN
       rotation =  offset `mod` n

rotEncoder :: String -> String
rotEncoder text = map rotChar text
 where alphaSize = 1 + fromEnum (maxBound :: Char)
       rotChar = rotN alphaSize
       
rotDecoder :: String -> String
rotDecoder text =  map rotCharDecoder text
 where alphaSize = 1 + fromEnum (maxBound :: Char)
       rotCharDecoder = rotNdecoder alphaSize

xorBool :: Bool -> Bool -> Bool
xorBool value1 value2 = (value1 || value2) && (not (value1 && value2))

xorPair :: (Bool,Bool) -> Bool
xorPair (v1,v2) = xorBool v1 v2

xor :: [Bool] -> [Bool] -> [Bool]
xor list1 list2 = map xorPair (zip list1 list2)

type Bits = [Bool]

intToBits' :: Int -> Bits
intToBits' 0 = [False]
intToBits' 1 = [True]
intToBits' n = if (remainder == 0)
               then False : intToBits' nextVal
               else True : intToBits' nextVal
 where remainder = n `mod` 2
       nextVal = n `div` 2

maxBits :: Int
maxBits = length (intToBits' maxBound)

intToBits :: Int -> Bits
intToBits n = leadingFalses ++ reversedBits
   where reversedBits = reverse  (intToBits' n)
         missingBits = maxBits - (length reversedBits)
         leadingFalses = take missingBits (cycle [False])

charToBits :: Char -> Bits
charToBits char = intToBits (fromEnum char)

bitsToInt :: Bits -> Int
bitsToInt bits = sum (map (\x -> 2^(snd x)) trueLocations)
 where size = length bits
       indices = [size-1,size-2 .. 0]
       trueLocations = filter (\x -> fst x == True)
                       (zip bits indices)

bitsToChar :: Bits -> Char
bitsToChar bits = toEnum (bitsToInt bits)

myPad :: String
myPad = "Shhhhhh"

myPlainText :: String
myPlainText = "Haskell"

applyOTP' :: String -> String -> [Bits]
applyOTP' pad plaintext =  map (\pair ->
                                 (fst pair) `xor` (snd pair))
                           (zip padBits plaintextBits)
 where padBits =  map charToBits pad
       plaintextBits =  map charToBits plaintext

applyOTP :: String -> String -> String
applyOTP pad plaintext = map bitsToChar bitList
 where bitList = applyOTP' pad plaintext

encoderDecoder :: String -> String
encoderDecoder = applyOTP myPad

class Cipher a where
   encode :: a -> String -> String
   decode :: a -> String -> String

data Rot = Rot

instance Cipher Rot where
   encode Rot text = rotEncoder text
   decode Rot text = rotDecoder text

data OneTimePad = OTP String

instance Cipher OneTimePad where
   encode (OTP pad) text = applyOTP pad text
   decode (OTP pad) text = applyOTP pad text

myOTP :: OneTimePad
myOTP = OTP (cycle [minBound .. maxBound])

prng :: Int -> Int -> Int -> Int -> Int
prng a b maxNumber seed = (a*seed + b) `mod` maxNumber

examplePRNG :: Int -> Int
examplePRNG  = prng 1337 7 100

-- Extension exercise

myPRNG = prng 1337 7 (fromEnum (maxBound :: Char))

pseudoRandomStream 1 seed = [myPRNG seed]
pseudoRandomStream length seed = nextSeed : pseudoRandomStream (length - 1) nextSeed
   where nextSeed = myPRNG seed

pseudoRandomPad :: [Int] -> String
pseudoRandomPad stream = map toEnum stream

data StreamCipher = StreamCipher String

instance Cipher StreamCipher where
   encode (StreamCipher pad) text = applyOTP pad text
   decode (StreamCipher pad) text = applyOTP pad text

myText :: String
myText = "My StreamCipher text"

myPseudoRandomStream = pseudoRandomStream (length myText) 1234

myPseudoRandomPad = pseudoRandomPad myPseudoRandomStream

myStreamCipher = StreamCipher myPseudoRandomPad
myEncodedStreamCipher = encode myStreamCipher myText
myDecodedStreamCipher = decode myStreamCipher myEncodedStreamCipher
