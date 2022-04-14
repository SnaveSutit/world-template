#Requires -RunAsAdministrator
# Load window forms
$repoDir = Get-Location
Add-Type -AssemblyName System.Windows.Forms
function getPath($name) {
	$browser = New-Object System.Windows.Forms.SaveFileDialog
	$browser.InitialDirectory = $repoDir
	$browser.Title = 'Select world save path'
	$browser.FileName = "my_$($name)"

	if ($browser.ShowDialog() -eq 'Ok') {
		$return = $browser.FileName
		Write-Host "Selected $($return) as destination for $($name) symlink"
		return $return
	} else {
		Write-Host "Setup process cancelled"
		exit
	}
}

$localDatapack = './world/datapacks/datapack'
# Collect all link paths before doing anything to allow for cancellation
$worldSymLink = getPath('world')
$resourcePackSymLink = getPath('resourcepack')

$localDatapackExists = Test-Path -Path $localDatapack

Write-Host "Are you sure you want to create these new links?"
if (-not($localDatapackExists)) {
	Write-Host "- new simlink 'world/datapacks/datapack' to $(Join-Path -Path $repoDir -ChildPath 'datapack')"
}
Write-Host "- new simlink '$($worldSymLink)' to $(Join-Path -Path $repoDir -ChildPath 'world')"
Write-Host "- new simlink '$($resourcePackSymLink)' to $(Join-Path -Path $repoDir -ChildPath 'resources')"
Read-Host -Prompt "Press Enter to Confirm"

# Make empty directories that github ignores
New-Item -ItemType Directory -Path "./world/datapacks/" -Force | Out-Null
New-Item -ItemType Directory -Path "./resources/assets/" -Force | Out-Null

# Create data pack link inside of world
if (-not($localDatapackExists)) {
	Write-Host "Creating new simlink '$($localDatapack)' to $(Join-Path -Path $repoDir -ChildPath 'datapack')"
	New-Item -ItemType SymbolicLink -Path $localDatapack -Target "./datapack" | Out-Null
}
# Create world symlink
Write-Host "Creating new simlink '$($worldSymLink)' to $(Join-Path -Path $repoDir -ChildPath 'world')"
New-Item -ItemType SymbolicLink -Path $worldSymLink -Target "./world" | Out-Null
# Create resource pack symlink
Write-Host "Creating new simlink '$($resourcePackSymLink)' to $(Join-Path -Path $repoDir -ChildPath 'resources')"
New-Item -ItemType SymbolicLink -Path $resourcePackSymLink -Target "./resources" | Out-Null

Write-Host "Setup Complete!"
