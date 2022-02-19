#Requires -RunAsAdministrator

	# Make empty directories that github ignores
New-Item -ItemType Directory -Path "./world/datapacks/" -Force
New-Item -ItemType Directory -Path "./resources/assets/" -Force

# Create data pack link
New-Item -ItemType SymbolicLink -Path "./world/datapacks/datapack" -Target "./datapack"

$worldPath = Read-Host -Prompt "World path"
New-Item -ItemType SymbolicLink -Path $worldPath -Target "./world"

$resourcePackPath = Read-Host -Prompt "Resource Pack path"
New-Item -ItemType SymbolicLink -Path $resourcePackPath -Target "./resources"
