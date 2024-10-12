
execute unless score version.villageemblems fpconflict.conflict_map matches 1 run tellraw @a ["",{"text":"[Conflict]","color":"red"}," - ",{"text":"Village Emblems Datapack ","color":"blue"},"(",{"text":"Overlapping versions.","italic":true,"color":"dark_aqua"},")"]

execute unless score version.towcit fpconflict.conflict_map matches 1 run tellraw @a ["",{"text":"[Conflict]","color":"red"}," - ",{"text":"Village Emblems Datapack ","color":"blue"},"(",{"text":"Requires Village Names (Version 1).","italic":true,"color":"dark_aqua"},")"]

