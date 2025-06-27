#
#   Get At
#   
#   Purpose: To get the item in storage list 'villageemblems:data list' at the provided index and put it in storage 'villageemblems:data list_item'
#
#   Input: { index: int }
#


data remove storage villageemblems:data list_item
$data modify storage villageemblems:data list_item set from storage villageemblems:data list[$(index)]


