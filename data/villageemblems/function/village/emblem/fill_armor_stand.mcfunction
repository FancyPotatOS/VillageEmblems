#
#   Give Armor Stand
#   
#   Purpose: To get a random item from storage 'villageemblems:data list' and put it in storage 'villageemblems:data list_item'
#
#   Input: None
#


data modify entity @s equipment.mainhand set value {id:"minecraft:emerald",count:1b,components:{"minecraft:rarity": "uncommon", "minecraft:custom_model_data":{"strings":["villageemblems"]}}}

data modify entity @s equipment.mainhand.components."minecraft:custom_model_data".strings append from storage villageemblems:data new_emblem.base

data modify entity @s equipment.mainhand.components."minecraft:custom_model_data".strings append from storage villageemblems:data new_emblem.body.type
data modify entity @s equipment.mainhand.components."minecraft:custom_model_data".strings append from storage villageemblems:data new_emblem.body.color

data modify entity @s equipment.mainhand.components."minecraft:custom_model_data".strings append from storage villageemblems:data new_emblem.emblem.type
data modify entity @s equipment.mainhand.components."minecraft:custom_model_data".strings append from storage villageemblems:data new_emblem.emblem.color

data modify entity @s equipment.mainhand.components."minecraft:custom_model_data".strings append from storage villageemblems:data new_emblem.lower_detail_0.type
data modify entity @s equipment.mainhand.components."minecraft:custom_model_data".strings append from storage villageemblems:data new_emblem.lower_detail_0.color

data modify entity @s equipment.mainhand.components."minecraft:custom_model_data".strings append from storage villageemblems:data new_emblem.lower_detail_1.type
data modify entity @s equipment.mainhand.components."minecraft:custom_model_data".strings append from storage villageemblems:data new_emblem.lower_detail_1.color

data modify entity @s equipment.mainhand.components."minecraft:custom_model_data".strings append from storage villageemblems:data new_emblem.lower_detail_2.type
data modify entity @s equipment.mainhand.components."minecraft:custom_model_data".strings append from storage villageemblems:data new_emblem.lower_detail_2.color

data modify entity @s equipment.mainhand.components."minecraft:custom_model_data".strings append from storage villageemblems:data new_emblem.middle_detail_0.type
data modify entity @s equipment.mainhand.components."minecraft:custom_model_data".strings append from storage villageemblems:data new_emblem.middle_detail_0.color

data modify entity @s equipment.mainhand.components."minecraft:custom_model_data".strings append from storage villageemblems:data new_emblem.middle_detail_1.type
data modify entity @s equipment.mainhand.components."minecraft:custom_model_data".strings append from storage villageemblems:data new_emblem.middle_detail_1.color

data modify entity @s equipment.mainhand.components."minecraft:custom_model_data".strings append from storage villageemblems:data new_emblem.middle_detail_2.type
data modify entity @s equipment.mainhand.components."minecraft:custom_model_data".strings append from storage villageemblems:data new_emblem.middle_detail_2.color

