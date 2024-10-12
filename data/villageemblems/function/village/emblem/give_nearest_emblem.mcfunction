#
#   Give Nearest Village Emblem
#   
#   Purpose: To give the current player the emblem of the nearest village
#
#   Input: None
#


execute unless entity @e[type=villager] run return fail

scoreboard players operation target villageemblems.master = @e[type=#towcit:villager,limit=1,sort=nearest] towcit.id

function villageemblems:village/emblem/give_emblem

