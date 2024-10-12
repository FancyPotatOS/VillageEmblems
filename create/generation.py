

import nbt
import os
import random as rng
import json


blank = "villageemblems:item/blank"


colors = [
    "aqua",
    "black",
    "blue",
    "dark_aqua",
    "dark_blue",
    "dark_gray",
    "dark_green",
    "dark_purple",
    "dark_red",
    "gold",
    "gray",
    "green",
    "light_purple",
    "red",
    "white",
    "yellow"
]

base_patterns = [
    "villageemblems:item/base/0",
    "villageemblems:item/base/1",
    "villageemblems:item/base/2",
    "villageemblems:item/base/3",
    "villageemblems:item/base/4",
    "villageemblems:item/base/5",
    "villageemblems:item/base/6",
    "villageemblems:item/base/7",
    "villageemblems:item/base/8",
    "villageemblems:item/base/9",
    "villageemblems:item/base/10",
    "villageemblems:item/base/11",
    "villageemblems:item/base/12",
    "villageemblems:item/base/13",
    "villageemblems:item/base/14",
    "villageemblems:item/base/15",
    "villageemblems:item/base/16",
]

detail_patterns = [
    "villageemblems:item/detail/curve/bottom/_COLOR_",
    "villageemblems:item/detail/curve/left/_COLOR_",
    "villageemblems:item/detail/curve/right/_COLOR_",
    "villageemblems:item/detail/curve/top/_COLOR_",
    "villageemblems:item/detail/diagonal/bottom_left/_COLOR_",
    "villageemblems:item/detail/diagonal/bottom_right/_COLOR_",
    "villageemblems:item/detail/diagonal/top_left/_COLOR_",
    "villageemblems:item/detail/diagonal/top_right/_COLOR_",
    "villageemblems:item/detail/straight/bottom/_COLOR_",
    "villageemblems:item/detail/straight/left/_COLOR_",
    "villageemblems:item/detail/straight/right/_COLOR_",
    "villageemblems:item/detail/straight/top/_COLOR_"
]

body_patterns = [
    "villageemblems:item/body/circle/_COLOR_",
    "villageemblems:item/body/diamond/_COLOR_",
    "villageemblems:item/body/glint/_COLOR_",
    "villageemblems:item/body/pentagon/_COLOR_",
    "villageemblems:item/body/shield/_COLOR_",
    "villageemblems:item/body/square/_COLOR_",
    "villageemblems:item/body/star/_COLOR_",
    "villageemblems:item/body/triangle/down/_COLOR_",
    "villageemblems:item/body/triangle/left/_COLOR_",
    "villageemblems:item/body/triangle/right/_COLOR_",
    "villageemblems:item/body/triangle/up/_COLOR_"
]

emblem_patterns = [
    "villageemblems:item/emblem/breeze/_COLOR_",
    "villageemblems:item/emblem/creeper/_COLOR_",
    "villageemblems:item/emblem/double/_COLOR_",
    "villageemblems:item/emblem/double_chevron/_COLOR_",
    "villageemblems:item/emblem/double_curve/_COLOR_",
    "villageemblems:item/emblem/flow/_COLOR_",
    "villageemblems:item/emblem/flower/_COLOR_",
    "villageemblems:item/emblem/globe/_COLOR_",
    "villageemblems:item/emblem/single_chevron/_COLOR_",
    "villageemblems:item/emblem/skull/_COLOR_",
    "villageemblems:item/emblem/snout/_COLOR_"
]

def generate_pattern(file_contents):
    base = rng.choice(base_patterns)
    
    another_detail = True
    lower_detail_0 = blank
    if another_detail:
        lower_detail_0 = rng.choice(detail_patterns).replace("_COLOR_", rng.choice(colors))

        another_detail = rng.random() < 0.5
    
    lower_detail_1 = blank
    if another_detail:
        lower_detail_1 = rng.choice(detail_patterns).replace("_COLOR_", rng.choice(colors))

        another_detail = rng.random() < 0.3333
    
    lower_detail_2 = blank
    if another_detail:
        lower_detail_2 = rng.choice(detail_patterns).replace("_COLOR_", rng.choice(colors))
    
    body = rng.choice(body_patterns).replace("_COLOR_", rng.choice(colors))
    
    another_detail = True
    middle_detail_0 = blank
    if another_detail:
        middle_detail_0 = rng.choice(detail_patterns).replace("_COLOR_", rng.choice(colors))

        another_detail = rng.random() < 0.5
    
    middle_detail_1 = blank
    if another_detail:
        middle_detail_1 = rng.choice(detail_patterns).replace("_COLOR_", rng.choice(colors))

        another_detail = rng.random() < 0.3333
    
    middle_detail_2 = blank
    if another_detail:
        middle_detail_2 = rng.choice(detail_patterns).replace("_COLOR_", rng.choice(colors))
    
    emblem = blank
    if rng.random() < 0.20:
        emblem = rng.choice(emblem_patterns).replace("_COLOR_", rng.choice(colors))

    return file_contents\
        .replace("_BASE_", base)\
        .replace("_LOWER_DETAIL_0_", lower_detail_0)\
        .replace("_LOWER_DETAIL_1_", lower_detail_1)\
        .replace("_LOWER_DETAIL_2_", lower_detail_2)\
        .replace("_BODY_", body)\
        .replace("_MIDDLE_DETAIL_0_", middle_detail_0)\
        .replace("_MIDDLE_DETAIL_1_", middle_detail_1)\
        .replace("_MIDDLE_DETAIL_2_", middle_detail_2)\
        .replace("_EMBLEM_", emblem)


def add_custom_model_data(emerald_model_path, emblem_number, custom_model_data):
    emblem_number = str(emblem_number)
    emerald_data = ""
    with open(emerald_model_path, "r") as file:
        emerald_data = "".join(file.readlines())

    emerald = json.loads(emerald_data)
    emerald["overrides"].insert(-1, { "predicate": { "custom_model_data": custom_model_data }, "model": f"villageemblems:item/emblems/{emblem_number}" })

    emerald["overrides"][-1]["predicate"]["custom_model_data"] = int(custom_model_data) + 1

    new_file_contents = str(emerald).replace("'", '"')

    with open(emerald_model_path, "w") as file:
        file.write(new_file_contents)


def create_model(resource_pack_path, id, custom_model_data):
    emblem_path = resource_pack_path + "\\assets\\villageemblems\\models\\item\\emblems"

    file_contents = ""
    with open("temp.json", "r") as file:
        file_contents = "".join(file.readlines())

    file_contents = generate_pattern(file_contents)

    with open(f"{emblem_path}\\{str(id)}.json", "w") as file:
        file.write(file_contents)

    emerald_model_path = resource_pack_path + "\\assets\\minecraft\\models\\item\\emerald.json"
        
    add_custom_model_data(emerald_model_path, id, custom_model_data)


def get_required_models(world_path, resource_pack_path):
    
    villageemblems_data_path = world_path + "\\data\\command_storage_villageemblems.dat"
    villageemblems_data = nbt.NBTFile(villageemblems_data_path, 'rb')

    # Get all required data values
    requireds = [{"id": int(x["id"].value), "custom_model_data": int(x["custom_model_data"].value)} for x in villageemblems_data["data"]["contents"]["data"]["gen_required"]]

    # Create models for each required data
    for required in requireds:
        create_model(resource_pack_path, required["id"], required["custom_model_data"])

    # Clear the gen_required list
    villageemblems_data["data"]["contents"]["data"]["clear_gen_required"].value = 1
    villageemblems_data.write_file(villageemblems_data_path)

