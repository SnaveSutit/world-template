# world-template
An advanced Minecraft world template for map makers

## OS Compatability
This template *should* be compatible with Windows, Mac, and Linux. However I've only tested it on Windows 11

## Setting up your world
How to initialize the template.
- Create a new repo using this template.
- Run `yarn` to install dependancies
- Then setup the repo with `yarn setup`
- Finally update `./src/config.js` to credit you instead of me.

## Developing
To enter development mode, change the terminal's working directory to one of the Data Packs and run `yarn dev`. This will start MC-Build in watch mode.

You can also run `yarn build` to run a cleaning production build of your project.

**NOTE:** The `build` command will erase the Data Pack's `data/` folder and re-construct it from the `src/` folder. Do not use it if you have files in `data/` that were not created using MC-Build.

## Packaging
If you run `yarn package` the packaging script will automatically clean, compile, combine and zip the world, Resource Pack, and Data Packs into the `dist/` folder.