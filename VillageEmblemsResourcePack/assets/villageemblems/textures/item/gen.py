
from PIL import Image
import os
import pyperclip


def replace_all(repl: str, replacements: dict[str, str]):
    for key in [str(k) for k in replacements.keys()]:
        repl = repl.replace(key, replacements[key])
    return repl

def replace_file(filename: str, replacements: dict[str, str]):
    contents = ""
    with open(filename, "r") as file:
        contents = "".join(file.readlines())
    
    with open(replace_all(filename, replacements), "w") as file:
        file.write(replace_all(contents, replacements))

palette = {
    "black":           [0,     0,      0],
    "dark_blue":       [0,     0,      170],
    "dark_green":      [0,     170,    0],
    "dark_aqua":       [0,     170,    170],
    "dark_red":        [170,   0,      0],
    "dark_purple":     [170,   0,      170],
    "gold":            [255,   170,    0],
    "gray":            [170,   170,    170],
    "dark_gray":       [85,    85,     85],
    "blue":            [85,    85,     255],
    "green":           [85,    255,    85],
    "aqua":            [85,    255,    255],
    "red":             [255,   85,     85],
    "light_purple":    [255,   85,     255],
    "yellow":          [255,   255,    85],
    "white":           [255,   255,    255]
}

body_shapes = [
    "circle",
    "diamond",
    "glint",
    "pentagon",
    "shield",
    "square",
    "star",
    "triangle"
]


emblems = [
    "breeze",
    "creeper",
    "double",
    "double_chevron",
    "double_curve",
    "flow",
    "flower",
    "globe",
    "single_chevron",
    "skull",
    "snout"
]

detail_types = [
    "lower_detail_0",
    "lower_detail_1",
    "lower_detail_2",
    "middle_detail_0",
    "middle_detail_1",
    "middle_detail_2",
]

details = [
    "curve/bottom",
    "curve/left",
    "curve/right",
    "curve/top",
    "diagonal/bottom_left",
    "diagonal/bottom_right",
    "diagonal/top_left",
    "diagonal/top_right",
    "straight/bottom",
    "straight/left",
    "straight/right",
    "straight/top",
]

color_file = """{
  "parent": "villageemblems:item/_DETAILTYPE_/base",
  "textures": {
		"_DETAILTYPE_": "villageemblems:item/detail/_DETAIL_/_COLOR_",
		"particle": "villageemblems:item/detail/_DETAIL_/_COLOR_"
  }
}"""

detail_color_repl = """
                      {
                        "when": "_COLOR_",
                        "model": {
                          "type": "minecraft:model",
                          "model": "villageemblems:item/_DETAILTYPE_/_DETAIL_/_COLOR_"
                        }
                      }"""

detail_repl = """
                {
                  "when": "_DETAIL_",
                  "model": {
                    "type": "minecraft:select",
                    "fallback": {
                      "type": "minecraft:model",
                      "model": "villageemblems:item/_DETAILTYPE_/base"
                    },
                    "property": "minecraft:custom_model_data",
                    "index": _INDEXPLUS_,
                    "cases": [_DETAILCOLORREPL_
                    ]
                  }
                }"""

detail_type_repl = """
            {
              "type": "minecraft:select",
              "fallback": {
                "type": "minecraft:model",
                "model": "villageemblems:item/_DETAILTYPE_/base"
              },
              "property": "minecraft:custom_model_data",
              "index": _INDEX_,
              "cases": [_DETAILTYPEREPL_
              ]
            }"""


os.chdir("assets/villageemblems/models/item/lower_detail_0")

replacements = {}
joint = []
index = 4
for detail_type in detail_types:
    index += 2
    os.chdir(f"../{detail_type}")
    replacements["_DETAILTYPE_"] = detail_type
    replacements["_INDEX_"] = str(index)
    replacements["_INDEXPLUS_"] = str(index + 1)

    joint1 = []
    for detail in details:
        splt = detail.split("/")
        if not os.path.exists(splt[0]):
            os.mkdir(splt[0])
        
        os.chdir(splt[0])
        if not os.path.exists(splt[1]):
            os.mkdir(splt[1])
        os.chdir("..")

        replacements["_DETAIL_"] = detail
        color_template_filename = f"{detail}/_COLOR_.json"
        
        with open(color_template_filename, "w") as file:
            file.write(color_file)
        
        joint2 = []
        for color in [str(k) for k in palette.keys()]:
            replacements["_COLOR_"] = color
            replace_file(color_template_filename, replacements)
            joint2.append(replace_all(detail_color_repl, replacements))
        replacements["_DETAILCOLORREPL_"] = ",".join(joint2)
        
        if os.path.exists(color_template_filename):
            os.remove(color_template_filename)

        joint1.append(replace_all(detail_repl, replacements))

    replacements["_DETAILTYPEREPL_"] = ",".join(joint1)
    
    joint.append(replace_all(detail_type_repl, replacements))

pyperclip.copy(",".join(joint))


color_file = """{
  "parent": "villageemblems:item/emblem/base",
  "textures": {
		"emblem": "villageemblems:item/emblem/_EMBLEM_/_COLOR_",
		"particle": "villageemblems:item/emblem/_EMBLEM_/_COLOR_"
  }
}"""

emblem_color_repl = """
                      {
                        "when": "_COLOR_",
                        "model": {
                          "type": "minecraft:model",
                          "model": "villageemblems:item/emblem/_EMBLEM_/_COLOR_"
                        }
                      }"""

emblem_repl = """
                {
                  "when": "_EMBLEM_",
                  "model": {
                    "type": "minecraft:select",
                    "fallback": {
                      "type": "minecraft:model",
                      "model": "villageemblems:item/emblem/base"
                    },
                    "property": "minecraft:custom_model_data",
                    "index": 5,
                    "cases": [_EMBLEMCOLORREPL_
                    ]
                  }
                }"""


os.chdir("../emblem")

replacements = {}
joint = []

for emblem in emblems:
    replacements["_EMBLEM_"] = emblem
    if not os.path.exists(emblem):
        os.mkdir(emblem)

    color_template_filename = f"{emblem}/_COLOR_.json"
    
    with open(color_template_filename, "w") as file:
        file.write(color_file)
    
    joint2 = []
    for color in [str(k) for k in palette.keys()]:
        replacements["_COLOR_"] = color
        replace_file(color_template_filename, replacements)
        joint2.append(replace_all(emblem_color_repl, replacements))
    replacements["_EMBLEMCOLORREPL_"] = ",".join(joint2)
    
    if os.path.exists(color_template_filename):
        os.remove(color_template_filename)

    joint.append(replace_all(emblem_repl, replacements))


pyperclip.copy(",".join(joint))



os.chdir("../body")

color_file = """{
  "parent": "villageemblems:item/body/base",
  "textures": {
		"body": "villageemblems:item/body/_SHAPE_/_COLOR_",
		"particle": "villageemblems:item/body/_SHAPE_/_COLOR_"
  }
}"""

shape_color_repl = """
                      {
                        "when": "_COLOR_",
                        "model": {
                          "type": "minecraft:model",
                          "model": "villageemblems:item/body/_SHAPE_/_COLOR_"
                        }
                      }"""

shape_repl = """
                {
                  "when": "_SHAPE_",
                  "model": {
                    "type": "minecraft:select",
                    "fallback": {
                      "type": "minecraft:model",
                      "model": "villageemblems:item/body/base"
                    },
                    "property": "minecraft:custom_model_data",
                    "index": 3,
                    "cases": [_SHAPECOLORREPL_
                    ]
                  }
                }"""

replacements = {}
joint = []
for body_shape in body_shapes:
    replacements["_SHAPE_"] = body_shape
    if not os.path.exists(body_shape):
        os.mkdir(body_shape)

    color_template_filename = f"{body_shape}/_COLOR_.json"
    
    with open(color_template_filename, "w") as file:
        file.write(color_file)
    
    joint2 = []
    for color in [str(k) for k in palette.keys()]:
        replacements["_COLOR_"] = color
        replace_file(color_template_filename, replacements)
        joint2.append(replace_all(shape_color_repl, replacements))
    replacements["_SHAPECOLORREPL_"] = ",".join(joint2)
    
    if os.path.exists(color_template_filename):
        os.remove(color_template_filename)

    joint.append(replace_all(shape_repl, replacements))


#pyperclip.copy(",".join(joint))


joint = []
for i in range(17):
    break
    replacements["_VALUE_"] = str(i)
    replace_file("_VALUE_.json", replacements)

    joint.append(replace_all("""
                {
                  "when": "_VALUE_",
                  "model": {
                    "type": "minecraft:model",
                    "model": "villageemblems:item/base/_VALUE_"
                  }
                }""", replacements))

#print(",".join(joint))





exit()

### OUTDATED
os.chdir("assets/villageemblems/textures/item")

def set_color(img: Image.Image, color):
    img = img.copy()

    for x in range(img.width):
        for y in range(img.height):
            pixel = img.getpixel((x, y))
            pixel = (int((pixel[0] * color[0])/256.0), int((pixel[1] * color[1])/256.0), int((pixel[2] * color[2])/256.0), pixel[3])
            img.putpixel((x,y ), pixel)

    return img



def process_file(filename):
    # Save cwd
    cwd = os.getcwd()

    img = Image.open(filename)
    img = img.convert("RGBA")

    foldername = filename.replace(".png", "")
    os.mkdir(foldername)
    os.chdir(foldername)

    for color in palette:
        rgb = palette[color]
        new_img = set_color(img, rgb)

        new_img.save(color + ".png")

    # Restore cwd
    os.chdir(cwd)


def process_folder(folder):
    # Save cwd
    cwd = os.getcwd()

    os.chdir(folder)

    folders = [folder for folder in os.listdir() if os.path.isdir(folder)]

    for file in [file for file in os.listdir() if os.path.isfile(file)]:
        process_file(file)

    for folder in folders:
        process_folder(folder)

    # Restore cwd
    os.chdir(cwd)


for folder in [ "crest", "detail" ]:
    process_folder(folder)

