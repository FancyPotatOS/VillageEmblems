#
#   Ensure Village Initialized
#   
#   Purpose: To ensure the village has an emblem or save it for creation
#
#   Input: None
#


# Save the village id
function villageemblems:macro/clear_cursor
execute store result storage villageemblems:data cursor.id int 1 run scoreboard players get @e[type=villager,limit=1,sort=nearest] towcit.id

# Check if village exists
function villageemblems:village/initialize/macro_village_exists with storage villageemblems:data cursor

# Create if doesn't exist
execute if data storage villageemblems:data {exists:0b} run function villageemblems:village/initialize/create

# Clean up
data remove storage villageemblems:data exists
function villageemblems:macro/clear_cursor

