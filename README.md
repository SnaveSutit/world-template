# world-template
An advanced Minecraft world template for map makers

## OS Compatability - Symbolic Links
This template is currently only compatible with Windows 10 and Windows 11.

We take advantage of Window's Symbolic Links to allow us to store our world outside of the saves folder and give multiple Minecraft instances access to the world without using any complex folder syncing.

## Setting up your world
How to use this template for map development
- Create a new repo using this template.
- Run the setup powershell script, and follow it's instructions.
- Replace all mentions of `world-template` with your project's name.
   - `./world/level.dat` -> `Data.LevelName`
   - `./src/pack.mcmeta` -> `pack.description`
- Update `./src/config.js` to use your information in the credit comment instead of mine.
