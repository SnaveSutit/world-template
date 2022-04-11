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
}
# Copy the world into the temp folder to prevfent accidentally breaking things
Copy-Item -Path './world/' -Destination './.temp/' -Recurse | Out-Null

# Compress the data pack and output it
# Compress-Archive -Path './datapack/*' -DestinationPath './dist/datapack.zip' | Out-Null
7z a './dist/datapack.zip' './datapack/*'

# Compress the resource pack and output it
# Compress-Archive -Path './resources/*' -DestinationPath './dist/resources.zip' | Out-Null
7z a './dist/resources.zip' './resources/*'

# Copy the compressed resource pack into the world
Copy-Item -Path './dist/resources.zip' -Destination './.temp/world/' -Recurse | Out-Null

# Compress the world and output it
# Compress-Archive -Path './.temp/world/*' -DestinationPath './dist/world.zip' | Out-Null
7z a './dist/world.zip' './.temp/world/*'

# Remove temporary files
Remove-Item -Path './.temp/' -Recurse -Force | Out-Null

Write-Host "Successfully packaged world and resource pack!"
