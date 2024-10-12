#
#   Create Village
#   
#   Purpose: To create a village emblem slot with the provided data
#
#   Input: { id: int, custom_model_data: int }
#


$data modify storage villageemblems:data emblems.$(id) set value {custom_model_data:$(custom_model_data)}

