#
#   Macro Set Emblem Item Name
#   
#   Purpose: To set the emblem item's
#
#   Input: { name: string }
#


$data modify entity @e[type=item,limit=1,sort=nearest,tag=villageemblems.item.new] Item.components."minecraft:item_name" set value "$(name) Emblem"

