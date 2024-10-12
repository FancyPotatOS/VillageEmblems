#
#   Get Village Emblem Data
#   
#   Purpose: To set the storage "villageemblems:data village_data" with the data of the provided village id
#
#   Input: { id: int }
#


$data modify storage villageemblems:data village_data set value {id:$(id)}

$data modify storage villageemblems:data village_data.villageemblems set from storage villageemblems:data emblems.$(id)
$data modify storage villageemblems:data village_data.towcit set from storage towcit:data names[$(id)]

