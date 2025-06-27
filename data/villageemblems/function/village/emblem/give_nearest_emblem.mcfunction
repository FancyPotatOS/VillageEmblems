#
#   Give Nearest Village Emblem
#   
#   Purpose: To give the current player the last generated emblem from storage 'villageemblems:data new_emblem'
#
#   Input: None
#


summon minecraft:armor_stand ~ ~ ~ {Tags:["villageemblems.new", "villageemblems.emblem_holder"],Invisible:1b,NoGravity:1b,Invulnerable:1b}

execute as @e[type=armor_stand,limit=1,sort=nearest] at @s run function villageemblems:village/emblem/fill_armor_stand

summon minecraft:item ~ ~ ~ {Tags:["villageemblems.item.new"],Item:{id:"minecraft:dirt",count:1b}}

data modify entity @e[type=item,tag=villageemblems.item.new,limit=1,sort=nearest] Item set from entity @e[type=minecraft:armor_stand,tag=villageemblems.new,limit=1,sort=nearest] equipment.mainhand

function villageemblems:macro/clear_cursor
data modify storage villageemblems:data cursor.name set from storage villageemblems:data latest_name
function villageemblems:village/emblem/macro_set_emblem_item_name with storage villageemblems:data cursor

kill @e[type=minecraft:armor_stand,tag=villageemblems.new]

