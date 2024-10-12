#
#   Macro Give Emblem Item
#   
#   Purpose: To give the emblem item with the provided data
#
#   Input: { id: int, custom_model_data: int, name: string }
#


#$say $(custom_model_data) "$(name)" $(id)

$give @s emerald[minecraft:custom_model_data=$(custom_model_data),minecraft:custom_name='{"text":"$(name) Emblem","italic":false}',minecraft:custom_data={villageemblems:{village_id:$(id)}}]

