
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
Compress-Archive -Path './datapack/*' -DestinationPath './dist/datapack.zip' | Out-Null
# Compress the resource pack and output it
Compress-Archive -Path './resources/*' -DestinationPath './dist/resources.zip' | Out-Null
# Copy the compressed resource pack into the world
Copy-Item -Path './dist/resources.zip' -Destination './.temp/world/' -Recurse | Out-Null
# Compress the world and output it
Compress-Archive -Path './.temp/world/*' -DestinationPath './dist/world.zip' | Out-Null
# Remove temporary files
Remove-Item -Path './.temp/' -Recurse -Force | Out-Null

Write-Host "Successfully packaged world and resource pack!"
