#
#   Migration File V1
#   
#   Purpose: To update the datapack up to this level, then apply new/updated configs or setup
#
#   Input: None
#

tellraw @a ["",{"text":"[Village Emblems Datapack]","bold":true,"color":"dark_blue"}," - Setup"]

# Apply last migration
#execute unless score version villageemblems.master matches 1.. run function villageemblems:meta/migrate/migration_v0

# Set the version
scoreboard players set version villageemblems.master 1

scoreboard players set next_custom_model_data villageemblems.master 776000

# Create village paths storage
data merge storage villageemblems:data {clear_gen_required:0,gen_required:[],emblems:{}}


return 0
scoreboard objectives add towcit.id dummy
scoreboard objectives add fpconflict.conflict_map dummy
