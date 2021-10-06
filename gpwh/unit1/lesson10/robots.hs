robot (name, attack, hp) = \message -> message (name, attack, hp)

killerRobotDef = ("Kill3r", 25, 200)
killerRobotByDef = robot killerRobotDef

killerRobot = robot ("Kill3r", 25, 200)
gentleGiant = robot ("Mr. Friendly", 10, 300)

name (n, _, _) = n
attack (_, a, _) = a
hp (_, _, hp) = hp

getName aRobot = aRobot name
getAttack aRobot = aRobot attack
getHP aRobot = aRobot hp

setName aRobot newName = aRobot (\(n, a, h) -> robot (newName, a, h))
setAttack aRobot newAttack = aRobot (\(n, a, h) -> robot (n, newAttack, h))
setHp aRobot newHP = aRobot (\(n, a, h) -> robot (n, a, newHP))

robotFred = robot ("Fred", 10, 100)
robotBarney = setName robotFred "Barney"

printRobot aRobot = aRobot (\(n, a, h) -> n ++
                                          " attack:" ++ (show a) ++
                                          " hp:" ++ (show h))

damage defender attackDamage = defender (\(n, a, h) -> 
                                          robot (n, a, h - attackDamage))

fight attacker defender = damage defender attack
    where attack = if getHP attacker > 10
                   then getAttack attacker
                   else 0

gentleGiantRound1 = fight killerRobot gentleGiant
killerRobotRound1 = fight gentleGiant killerRobot
gentleGiantRound2 = fight killerRobotRound1 gentleGiantRound1
killerRobotRound2 = fight gentleGiantRound1 killerRobotRound1
gentleGiantRound3 = fight killerRobotRound2 gentleGiantRound2
killerRobotRound3 = fight gentleGiantRound2 killerRobotRound2

trf g k g' k' = (fight g k, fight k' g')

-- Exercise extensions
-- 1.
getRobotLives = map getHP
robotLives = getRobotLives [killerRobot, gentleGiant]

-- 2.
-- What a mess. I might come back to this after I've learned more about types.
-- threeRoundFight robotA robotB = winner
--     where winner = if getHP robotARound3 > getHP robotBRound3
--                    then robotARound3
--                    else 
--                        if getHP robotARound3 < getHP robotBRound3
--                        then robotBRound3
--                        else robot ("tie", 0, 0)
--           (robotARound3, robotBRound3) = foldl 
        --   robotARound3 = fight 
        --     (fight 
        --         (fight robotA robotB) 
        --         (fight robotB robotA) 
        --     ) 
        --     (fight 
        --         (fight robotB robotA) 
        --         (fight robotA robotB) 
        --     ) 
        --   robotBRound3 = fight 
        --     (fight 
        --         (fight robotB robotA) 
        --         (fight robotA robotB) 
        --     ) 
        --     (fight 
        --         (fight robotA robotB) 
        --         (fight robotB robotA) 
        --     ) 
        --   robotARound3 = fight robotARound2 robotBRound2
        --   robotBRound3 = fight robotBRound2 robotARound2
        --   robotARound2 = fight robotARound1 robotBRound1
        --   robotBRound2 = fight robotBRound1 robotARound1
--           robotARound1 = fight robotA robotB
--           robotBRound1 = fight robotB robotA
-- gentleKillerWinner = threeRoundFight gentleGiant killerRobot

-- 3.
-- I'm also getting a type error on this one.
-- threeRobots = [robot ("Larry", 5, 500), robot ("Curly", 500, 50), robot ("Moe", 50, 5)]
-- fourthRobot = robot ("Shemp", 50, 500)
-- genFight fourth = \fourth opponent -> fight fourth opponent
-- fourthRobotFight = genFight fourthRobot
-- fourthRobotFights = map fourthRobotFight
-- fightResults = fourthRobotFights threeRobots
-- opponentLives = map getHP fightResults