cup flOz = \message -> message flOz
getOz aCup = aCup (\flOz -> flOz)
drink aCup ozDrunk = if ozDiff >= 0
                     then cup ozDiff
                     else cup 0
    where flOz = getOz aCup
          ozDiff = flOz - ozDrunk
isEmpty aCup = getOz aCup == 0
