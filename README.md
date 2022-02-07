# world-template
An advanced Minecraft world template for map makers

## Setup
How to use this template for map development
- Create a new repo using this template.
- Setup a symbolic link to `world-template/datapack` in `world-template/world/datapacks/`
- Setup a symbolic link to `world-template/resources` in your Minecraft `resourcepacks` folder
- Setup a symbolic link to `world-template/world` in your Minecraft `saves` folder
- Modify the `level.dat` file and change the level name to your map's name
- Run `mcb` inside of the `repo/datapack` folder


## Symbolic Links
Sybolic links allow us to have a folder be used in two places at once without having to setup any complex folder syncing.

Creating a Symbolic Link using powershell
`new-item -ItemType SymbolicLink -Path "Link Name" -Target "Path to linked folder/file"`
