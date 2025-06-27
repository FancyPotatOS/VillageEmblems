#
#   Random
#   
#   Purpose: To a random number from 'min' to 'max' (inclusive) and store it in scoreboard 'temp.rng villageemblems.master'
#
#   Input: { min: int, max: int }
#


$execute store result score temp.rng villageemblems.master run random value $(min)..$(max)

