#
#   Village Exists
#   
#   Purpose: To check if a village emblem exists
#
#   Input: { id: int }
#


data modify storage villageemblems:data exists set value 0b
$execute if data storage villageemblems:data emblems.$(id) run data modify storage villageemblems:data exists set value 1b

