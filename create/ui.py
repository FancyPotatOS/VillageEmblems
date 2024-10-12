

from tkinter import *
from tkinter import ttk
from tkinter import filedialog

import os
import ast

import generation


world_dir = os.getcwd()
resource_pack_dir = os.getcwd()


def load_settings():
    global world_dir
    global resource_pack_dir

    if os.path.exists("ve.settings"):
        settings = {}
        with open("ve.settings", "r") as file:
            settings = ast.literal_eval(file.readline())
        
        world_dir = settings["world_dir"]
        resource_pack_dir = settings["resource_pack_dir"]


def save_settings():
    global world_dir
    global resource_pack_dir
    
    settings = {
        "world_dir": world_dir,
        "resource_pack_dir": resource_pack_dir
    }
    file_contents = str(settings)
    with open("ve.settings", "w") as file:
        file.write(file_contents)


def get_resource_pack_dir():
    global resource_pack_dir

    cwd = os.getcwd()
    provided_path = filedialog.askdirectory(initialdir=f"{os.getenv('APPDATA')}\\.minecraft\\resourcepacks")

    if not provided_path:
        return
    
    os.chdir(provided_path)
    exists = os.path.exists("assets")
    os.chdir(cwd)

    if not exists:
        return
    
    resource_pack_directory.set(provided_path)
    resource_pack_dir = provided_path

def get_world_dir():
    global world_dir

    cwd = os.getcwd()
    provided_path = filedialog.askdirectory(initialdir=f"{os.getenv('APPDATA')}\\.minecraft\\saves")

    if not provided_path:
        return
    
    os.chdir(provided_path)
    exists = os.path.exists("datapacks")
    os.chdir(cwd)

    if not exists:
        return

    world_directory.set(provided_path)
    world_dir = provided_path


def generate():
    world_dir = world_directory.get()
    resource_pack_dir = resource_pack_directory.get()
    generation.get_required_models(world_dir, resource_pack_dir)


load_settings()

root = Tk()
root.title("Village Emblem Tool")


mainframe = ttk.Frame(root, padding="20 20 12 12")
mainframe.grid(column=1, row=5, sticky=(N, W, E, S))
root.columnconfigure(0, weight=1)
root.rowconfigure(0, weight=1)


ttk.Button(mainframe, text="Set Resource Pack Directory", command=get_resource_pack_dir).grid(column=0, row=0, sticky=W)

resource_pack_directory = StringVar(value=resource_pack_dir)
ttk.Label(mainframe, textvariable=resource_pack_directory, name="res_pack_dir").grid(column=0, row=1, sticky=(N))


ttk.Button(mainframe, text="Set World Directory", command=get_world_dir).grid(column=0, row=2, sticky=W)

world_directory = StringVar(value=world_dir)
ttk.Label(mainframe, textvariable=world_directory, name="world_dir").grid(column=0, row=3, sticky=(N))


ttk.Button(mainframe, text="Generate Emblems", command=generate).grid(column=0, row=4, sticky=W)

for child in mainframe.winfo_children(): 
    child.grid_configure(padx=15, pady=15)

root.mainloop()

save_settings()

