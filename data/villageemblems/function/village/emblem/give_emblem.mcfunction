#
#   Give Village Emblem
#   
#   Purpose: To give the current player the emblem of the village with the id from scoreboard 'target villageemblems.master'
#
#   Input: None
#


# Clear the cursor
function villageemblems:macro/clear_cursor

# Get the village data
execute store result storage villageemblems:data cursor.id int 1 run scoreboard players get target villageemblems.master
function villageemblems:village/macro_get_village_data with storage villageemblems:data cursor

# Clear the cursor again
function villageemblems:macro/clear_cursor
data modify storage villageemblems:data cursor.id set from storage villageemblems:data village_data.id
data modify storage villageemblems:data cursor.custom_model_data set from storage villageemblems:data village_data.villageemblems.custom_model_data
data modify storage villageemblems:data cursor.name set from storage villageemblems:data village_data.towcit

function villageemblems:village/emblem/macro_give with storage villageemblems:data cursor

# Clean up
data remove storage villageemblems:data village_data
data remove storage villageemblems:data cursor

