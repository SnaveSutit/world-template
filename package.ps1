
# Remove old dist folder and it's contents if it exists
if (Test-Path -Path './dist') {
	Remove-Item -Path './dist/' -Recurse -Force
}
# Create new dist folder
New-Item -ItemType Directory -Path "./dist/" -Force
# Make sure the .temp folder exists
if (-not(Test-Path -Path './.temp')) {
	New-Item -ItemType Directory -Path "./.temp/" -Force
}
# Copy the world into the temp folder to prevfent accidentally breaking things
Copy-Item -Path './world/' -Destination './.temp/' -Recurse
# Compress the resource pack and output it
Compress-Archive -Path './resources/*' -DestinationPath './dist/resources.zip'
# Copy the compressed resource pack into the world
Copy-Item -Path './dist/resources.zip' -Destination './.temp/world/' -Recurse
# Compress the world and output it
Compress-Archive -Path './.temp/world/*' -DestinationPath './dist/world.zip'
# Remove temporary files
Remove-Item -Path './.temp/' -Recurse -Force

Write-Host "Successfully packaged world and resource pack!"
