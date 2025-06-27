#
#   Create Village
#   
#   Purpose: To create a village emblem slot with the provided data
#
#   Input: { id: int, custom_model_data: int }
#


$data modify storage villageemblems:data emblems.$(id) set value {version: 2, emblem_data: {}, name: ""}
$data modify storage villageemblems:data emblems.$(id).emblem_data set from storage villageemblems:data new_emblem 
$data modify storage villageemblems:data emblems.$(id).name set from storage towcit:data names[$(id)]

$data modify storage villageemblems:data latest_name set from storage towcit:data names[$(id)]

