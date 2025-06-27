#
#   Create Village Data
#   
#   Purpose: To save the village for emblem creation
#
#   Input: None
#


# Save the next custom model data and village ID
scoreboard players operation custom_model_data villageemblems.master = next_custom_model_data villageemblems.master
scoreboard players operation target_village villageemblems.master = @e[type=villager,limit=1,sort=nearest] towcit.id

# Collect village id
data modify storage villageemblems:data new_requirement set value {id:0}
execute store result storage villageemblems:data new_requirement.id int 1 run scoreboard players get target_village villageemblems.master

# Generate a new emblem
function villageemblems:village/emblem/generate

# Prepare cursor
function villageemblems:macro/clear_cursor
data modify storage villageemblems:data cursor.id set from storage villageemblems:data new_requirement.id
function villageemblems:village/initialize/macro_village_create with storage villageemblems:data cursor

# Give the current player a new emblem
execute at @s run function villageemblems:village/emblem/give_nearest_emblem

# Clean up
#data remove storage villageemblems:data new_emblem
data remove storage villageemblems:data new_requirement

