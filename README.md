# world-template

## Setup
How to use this template for map development
- Create a new repo using this template.
- Setup a symbolic link to `repo-folder/datapack` in `repo/world/datapacks/`
- Setup a symbolic link to `repo/world` in your minecraft saves folder
- Modify the `level.dat` file and change the level name to your map's name
- Run `mcb` inside of the `repo/datapack` folder


## Symbolic Links
Sybolic links allow us to have a folder be used in two places at once without having to setup any complex folder syncing.

Creating a Symbolic Link using powershell
`new-item -ItemType SymbolicLink -Path "Link Name" -Target "Path to linked folder/file"`
