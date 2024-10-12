
## Village Emblems Datapack

_By FancyPotatOS_


_This datapack requires [Village Names](https://github.com/FancyPotatOS/VillageNames)_

Each village is designed a random 'emblem' - a special texture placed upon a gem.


### How to use

Unfortunately for this functionality, there is some 'external' steps required to apply the emblem to a resource pack. This datapack also only supports singleplayer worlds at the moment.

#### Setting up
1. Install the datapack
2. Unzip the resource pack and place it in your resource pack folder

#### Creating the emblems
1. Visit a village (The name should appear on your screen)
    - You can visit as many villages as you want, it'll create emblems for every single one you've been to!

2. Shut down the world

3. Run the VillageEmblemTool.exe located in the datapack's /create/dist folder
    - Provide the resource pack directory and world directory
    - Keep in mind that there should be 1 resource pack per world, so make copies as to ensure you don't overwrite other world's emblems!
    - Due to this, I always name mine 'VillageEmblemsCreative' or whatever the world name is afterwards as a reminder.
4. Click generate. If there is no error on the console, you are done!
5. Re-enter the world and reload your resource packs

There is currently no way to get the emblems in survival (for now...) so just run the command `function villageemblems:village/emblem/give_nearest_emblem`. This will give you the emblem of the village the nearest villager belongs to.

