#
#   Migration File V1
#   
#   Purpose: To update the datapack up to this level, then apply new/updated configs or setup
#
#   Input: None
#


# Apply last migration
execute unless score version villageemblems.master matches 2.. run function villageemblems:meta/migrations/migration_v0

# Set the version
scoreboard players set version villageemblems.master 2

data modify storage villageemblems:data all_emblem_data set value {\
    "colors": [ "aqua", "black", "blue", "dark_aqua", "dark_blue", "dark_gray", "dark_green", "dark_purple", "dark_red", "gold", "gray", "green", "light_purple", "red", "white", "yellow" ],\
    "base": [ "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "16" ],\
    "body": [ "circle", "diamond", "glint", "pentagon", "shield", "square", "star", "triangle/up", "triangle/down", "triangle/left", "triangle/right" ],\
    "emblem": [ "breeze", "creeper", "double", "double_chevron", "double_curve", "flow", "flower", "globe", "single_chevron", "skull", "snout" ],\
    "detail": [ "curve/bottom", "curve/left", "curve/right", "curve/top", "diagonal/bottom_left", "diagonal/bottom_right", "diagonal/top_left", "diagonal/top_right", "straight/bottom", "straight/left", "straight/right", "straight/top" ]\
}


