type FirstName = String
type LastName = String
type Age = Int
type Height = Int
type PatientName = (String,String)

-- QC 12.1
patientInfo :: PatientName -> Age -> Height -> String
patientInfo (fname, lname) age height = name ++ " " ++ ageHeight
 where name = lname ++ ", " ++ fname
       ageHeight = "(" ++ show age ++ "yrs. " ++ show height ++ "in.)"

data Sex = Male | Female
sexInitial :: Sex -> Char
sexInitial Male = 'M'
sexInitial Female = 'F'

canDonateTo :: BloodType -> BloodType -> Bool
canDonateTo (BloodType O _) _ = True
canDonateTo _ (BloodType AB _) = True
canDonateTo (BloodType A _) (BloodType A _) = True
canDonateTo (BloodType B _) (BloodType B _) = True
canDonateTo _ _ = False --otherwise

type MiddleName = String
data Name = Name FirstName LastName
          | NameWithMiddle FirstName MiddleName LastName

showName :: Name -> String
showName (Name f l) = f ++ " " ++ l
showName (NameWithMiddle f m l) = f ++ " " ++ m ++ " " ++ l

data RhType = Pos | Neg
data ABOType = A | B | AB | O
data BloodType = BloodType ABOType RhType

showRh :: RhType -> String
showRh Pos = "+"
showRh Neg = "-"
showABO :: ABOType -> String
showABO A = "A"
showABO B = "B"
showABO AB = "AB"
showABO O = "O"
showBloodType :: BloodType -> String
showBloodType (BloodType abo rh)  = showABO abo ++ showRh rh

data Patient = Patient Name Sex Int Int Int BloodType
-- QC 12.2
janeESmith :: Patient
janeESmith = Patient (NameWithMiddle "Jane" "Elizabeth" "Smith") Female 243 5 5778 (BloodType O Neg)

data Patient' = Patient' { name :: Name
                       , sex :: Sex
                       , age :: Int
                       , height :: Int
                       , weight :: Int
                       , bloodType :: BloodType }

jackieSmith :: Patient'
jackieSmith = Patient' {name = Name "Jackie" "Smith"
                      , age = 43
                      , sex = Female
                      , height = 62
                      , weight = 115
                      , bloodType = BloodType O Neg }

-- QC 12.3
jackieSmithName :: String
jackieSmithName = showName (name jackieSmith)

-- Q12.1
canDonateTo' :: Patient -> Patient -> Bool
canDonateTo' (Patient _ _ _ _ _ (BloodType O _)) _ = True
canDonateTo' _ (Patient _ _ _ _ _ (BloodType AB _)) = True
canDonateTo' (Patient _ _ _ _ _ (BloodType A _)) (Patient _ _ _ _ _ (BloodType A _)) = True
canDonateTo' (Patient _ _ _ _ _ (BloodType B _)) (Patient _ _ _ _ _ (BloodType B _)) = True
canDonateTo' _ _ = False

-- Q12.2
patientSummary :: Patient' -> String
patientSummary patient = "**************\n"
      ++ "Patient Name: " ++ showLastNameFirstName (name patient) ++ "\n"
      ++ "Sex: " ++ showSex (sex patient) ++ "\n"
      ++ "Age: " ++ show (age patient) ++ "\n"
      ++ "Height: " ++ show (height patient) ++ " in.\n"
      ++ "Weight: " ++ show (weight patient) ++ " lbs.\n"
      ++ "Blood Type: " ++ showBloodType (bloodType patient) ++ "\n"
      ++ "**************"

showLastNameFirstName :: Name -> String
showLastNameFirstName (Name f l) = l ++ ", " ++ f
showLastNameFirstName (NameWithMiddle f m l) = l ++ ", " ++ f ++ " " ++ m

showSex :: Sex -> String
showSex Male = "Male"
showSex Female = "Female"
