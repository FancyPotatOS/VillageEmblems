#
#   Generate
#   
#   Purpose: To generate new emblem data and store it in 'storage villageemblems:data new_emblem'
#
#   Input: None
#


data modify storage villageemblems:data new_emblem set value {\
    "base": "",\
    "body": { "type": "", "color": "" },\
    "emblem": { "type": "", "color": "" },\
    "lower_detail_0": { "type": "", "color": "" },\
    "lower_detail_1": { "type": "", "color": "" },\
    "lower_detail_2": { "type": "", "color": "" },\
    "middle_detail_0": { "type": "", "color": "" },\
    "middle_detail_1": { "type": "", "color": "" },\
    "middle_detail_2": { "type": "", "color": "" }\
}

# Emblem data storaged in "villageemblems:data all_emblem_data"


### base type
# Get list item
data modify storage villageemblems:data list set from storage villageemblems:data all_emblem_data.base
function villageemblems:village/emblem/get_random_item
# Set from list index item
data modify storage villageemblems:data new_emblem.base set from storage villageemblems:data list_item
### base type


### body type
# Get list item
data modify storage villageemblems:data list set from storage villageemblems:data all_emblem_data.body
function villageemblems:village/emblem/get_random_item
# Set from list index item
data modify storage villageemblems:data new_emblem.body.type set from storage villageemblems:data list_item
### body type
### body color
# Get list item
data modify storage villageemblems:data list set from storage villageemblems:data all_emblem_data.colors
function villageemblems:village/emblem/get_random_item
# Set from list index item
data modify storage villageemblems:data new_emblem.body.color set from storage villageemblems:data list_item
### body color


### emblem type
# Get list item
data modify storage villageemblems:data list set from storage villageemblems:data all_emblem_data.emblem
function villageemblems:village/emblem/get_random_item
# Set from list index item
data modify storage villageemblems:data new_emblem.emblem.type set from storage villageemblems:data list_item
### emblem type
### emblem color
# Get list item
data modify storage villageemblems:data list set from storage villageemblems:data all_emblem_data.colors
function villageemblems:village/emblem/get_random_item
# Set from list index item
data modify storage villageemblems:data new_emblem.emblem.color set from storage villageemblems:data list_item
### emblem color


### lower_detail_0 type
# Get list item
data modify storage villageemblems:data list set from storage villageemblems:data all_emblem_data.detail
function villageemblems:village/emblem/get_random_item
# Set from list index item
data modify storage villageemblems:data new_emblem.lower_detail_0.type set from storage villageemblems:data list_item
### lower_detail_0 type
### lower_detail_0 color
# Get list item
data modify storage villageemblems:data list set from storage villageemblems:data all_emblem_data.colors
function villageemblems:village/emblem/get_random_item
# Set from list index item
data modify storage villageemblems:data new_emblem.lower_detail_0.color set from storage villageemblems:data list_item
### lower_detail_0 color


### lower_detail_1 type
# Get list item
data modify storage villageemblems:data list set from storage villageemblems:data all_emblem_data.detail
function villageemblems:village/emblem/get_random_item
# Set from list index item
execute if predicate villageemblems:fifty_fifty run data modify storage villageemblems:data new_emblem.lower_detail_1.type set from storage villageemblems:data list_item
### lower_detail_1 type
### lower_detail_1 color
# Get list item
data modify storage villageemblems:data list set from storage villageemblems:data all_emblem_data.colors
function villageemblems:village/emblem/get_random_item
# Set from list index item
data modify storage villageemblems:data new_emblem.lower_detail_1.color set from storage villageemblems:data list_item
### lower_detail_1 color


### lower_detail_2 type
# Get list item
data modify storage villageemblems:data list set from storage villageemblems:data all_emblem_data.detail
function villageemblems:village/emblem/get_random_item
# Set from list index item
execute if predicate villageemblems:one_third run data modify storage villageemblems:data new_emblem.lower_detail_2.type set from storage villageemblems:data list_item
### lower_detail_2 type
### lower_detail_2 color
# Get list item
data modify storage villageemblems:data list set from storage villageemblems:data all_emblem_data.colors
function villageemblems:village/emblem/get_random_item
# Set from list index item
data modify storage villageemblems:data new_emblem.lower_detail_2.color set from storage villageemblems:data list_item
### lower_detail_2 color


### middle_detail_0 type
# Get list item
data modify storage villageemblems:data list set from storage villageemblems:data all_emblem_data.detail
function villageemblems:village/emblem/get_random_item
# Set from list index item
data modify storage villageemblems:data new_emblem.middle_detail_0.type set from storage villageemblems:data list_item
### middle_detail_0 type
### middle_detail_0 color
# Get list item
data modify storage villageemblems:data list set from storage villageemblems:data all_emblem_data.colors
function villageemblems:village/emblem/get_random_item
# Set from list index item
data modify storage villageemblems:data new_emblem.middle_detail_0.color set from storage villageemblems:data list_item
### middle_detail_0 color


### middle_detail_1 type
# Get list item
data modify storage villageemblems:data list set from storage villageemblems:data all_emblem_data.detail
function villageemblems:village/emblem/get_random_item
# Set from list index item
execute if predicate villageemblems:fifty_fifty run data modify storage villageemblems:data new_emblem.middle_detail_1.type set from storage villageemblems:data list_item
### middle_detail_1 type
### middle_detail_1 color
# Get list item
data modify storage villageemblems:data list set from storage villageemblems:data all_emblem_data.colors
function villageemblems:village/emblem/get_random_item
# Set from list index item
data modify storage villageemblems:data new_emblem.middle_detail_1.color set from storage villageemblems:data list_item
### middle_detail_1 color


### middle_detail_2 type
# Get list item
data modify storage villageemblems:data list set from storage villageemblems:data all_emblem_data.detail
function villageemblems:village/emblem/get_random_item
# Set from list index item
execute if predicate villageemblems:one_third run data modify storage villageemblems:data new_emblem.middle_detail_2.type set from storage villageemblems:data list_item
### middle_detail_2 type
### middle_detail_2 color
# Get list item
data modify storage villageemblems:data list set from storage villageemblems:data all_emblem_data.colors
function villageemblems:village/emblem/get_random_item
# Set from list index item
data modify storage villageemblems:data new_emblem.middle_detail_2.color set from storage villageemblems:data list_item
### middle_detail_2 color

