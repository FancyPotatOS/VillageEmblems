#
#   Get Random Item
#   
#   Purpose: To get a random item from storage 'villageemblems:data list' and put it in storage 'villageemblems:data list_item'
#
#   Input: None
#


# Get random index
function villageemblems:macro/clear_cursor
# # Min is 0!
data modify storage villageemblems:data cursor.min set value 0
# # Max is 1 less then list
execute store result score temp.list_len villageemblems.master run data get storage villageemblems:data list
scoreboard players remove temp.list_len villageemblems.master 1
execute store result storage villageemblems:data cursor.max int 1 run scoreboard players get temp.list_len villageemblems.master
# # RNG call
function villageemblems:macro/random with storage villageemblems:data cursor
# # Get at index
function villageemblems:macro/clear_cursor
execute store result storage villageemblems:data cursor.index int 1 run scoreboard players get temp.rng villageemblems.master

# Get index call
function villageemblems:macro/get_at with storage villageemblems:data cursor

