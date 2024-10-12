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

# Collect data
data modify storage villageemblems:data new_requirement set value {id:0,custom_model_data:0}
execute store result storage villageemblems:data new_requirement.id int 1 run scoreboard players get target_village villageemblems.master
execute store result storage villageemblems:data new_requirement.custom_model_data int 1 run scoreboard players get custom_model_data villageemblems.master

# Store in requirement
data modify storage villageemblems:data gen_required append from storage villageemblems:data new_requirement

# Store in emblems
function villageemblems:macro/clear_cursor
data modify storage villageemblems:data cursor.id set from storage villageemblems:data new_requirement.id
data modify storage villageemblems:data cursor.custom_model_data set from storage villageemblems:data new_requirement.custom_model_data
function villageemblems:village/initialize/macro_village_create with storage villageemblems:data cursor

# Increment model data number
scoreboard players add next_custom_model_data villageemblems.master 1

data remove storage villageemblems:data new_requirement

