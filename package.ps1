# TODO Add custom package names and versioning. Maybe using a simpel package.json?

# Use 7z because for some reason powershell's built-in compression causes corrupted zip files
$7zipPath = "$env:programFiles\7-Zip\7z.exe"
if (-not (Test-Path -Path $7zipPath -PathType Leaf)) {
	throw "7 zip file '$7zipPath' not found"
}

Set-Alias 7z $7zipPath

# Remove old dist folder and it's contents if it exists
if (Test-Path -Path './dist') {
	Remove-Item -Path './dist/' -Recurse -Force | Out-Null
}
# Create new dist folder
New-Item -ItemType Directory -Path "./dist/" -Force | Out-Null
# Make sure the .temp folder exists
if (-not(Test-Path -Path './.temp')) {
	New-Item -ItemType Directory -Path "./.temp/" -Force | Out-Null
} else {
	Remove-Item -Path './.temp/*' -Recurse -Force | Out-Null
}
# Copy the world, resource pack, and data pack into the .temp folder to prevent accidentally breaking things
Copy-Item -Path './world/' -Destination './.temp/' -Recurse | Out-Null
Copy-Item -Path './resources/' -Destination './.temp/' -Recurse | Out-Null
Copy-Item -Path './datapack/' -Destination './.temp/' -Recurse | Out-Null
# Remove the old data pack from the world
Remove-Item -Path './.temp/world/datapacks/datapack/' -Recurse -Force | Out-Null

# Clean the data pack of any mcb material
# Clean up MCBuild
Remove-Item -Path './.temp/datapack/src/' -Recurse -Force | Out-Null
Remove-Item -Path './.temp/datapack/.mcproject/' -Recurse -Force | Out-Null
Remove-Item -Path './.temp/datapack/config.js' -Recurse -Force | Out-Null
Remove-Item -Path './.temp/datapack/config.json' -Recurse -Force | Out-Null
# Clean up empty folders
Get-ChildItem './.temp/datapack/' -Directory -Recurse | Where-Object { $_.GetFileSystemInfos().Count -eq 0} | Out-Null
# Compress the cleaned data pack and output it
7z a './dist/datapack.zip' './.temp/datapack/*'

# Clean the resource pack of any dev material
# Remove .ajmodels
Get-ChildItem './.temp/resources/' -Include '*.ajmodel' -Recurse | Remove-Item | Out-Null
# Clean up empty folders
Get-ChildItem './.temp/resources/' -Directory -Recurse | Where-Object { $_.GetFileSystemInfos().Count -eq 0} | Out-Null
# Compress the resource pack and output it
7z a './dist/resources.zip' './.temp/resources/*'

# Copy the compressed and cleaned resource pack into the world
Copy-Item -Path './dist/resources.zip' -Destination './.temp/world/' -Recurse | Out-Null
# Copy the compressed and cleaned data pack into the world
Copy-Item -Path './dist/datapack.zip' -Destination './.temp/world/datapacks/' -Recurse | Out-Null

# Clean up the world
Remove-Item -Path './.temp/world/advancements/' -Recurse -Force | Out-Null
Remove-Item -Path './.temp/world/playerdata/' -Recurse -Force | Out-Null
Remove-Item -Path './.temp/world/poi/' -Recurse -Force | Out-Null
Remove-Item -Path './.temp/world/stats/' -Recurse -Force | Out-Null
Remove-Item -Path './.temp/world/level.dat_old' -Recurse -Force | Out-Null
Remove-Item -Path './.temp/world/session.lock' -Recurse -Force | Out-Null
# Compress the world and output it
7z a './dist/world.zip' './.temp/world/*'

# Remove temporary files
Remove-Item -Path './.temp/' -Recurse -Force | Out-Null

Write-Host "Successfully packaged world and resource pack!"
