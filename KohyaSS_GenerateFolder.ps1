$newModelName = Read-Host -Prompt "Input new model name"
$nsfwPrompt = (Read-Host -Prompt "NSFW? Y/N")
$nsfwBool = $nsfwPrompt -eq "Y"
$authorName = "AuthorNameHere"
$defaultSourcemodelPath = "ModelPathHere"

#How many steps do we want each picture to train for?
$stepAmount = 10
$destinationFolder = "$(Get-Location)"


# Change new folder location to NSFW folder for sorting
if ($nsfwBool)
{
	$destinationFolder = $destinationFolder + "\_NSFW\" + $newModelName
}
else
{
	$destinationFolder = $destinationFolder + "\" + $newModelName
}

#Copy the format folder + contents over to new destination
Copy-Item -Path "__NEW format" -Destination $destinationFolder -Recurse


# set variables so we can rename old folders with authorname and modelname
$imagePath = $destinationFolder + "\image\10_authorname_modelname"
$imageRawPath = $destinationFolder + "\image_raw\10_authorname_modelname"

# Rename format folders
Rename-Item -Path $imagePath -NewName "$($stepAmount)_$($authorName)_$($newModelName)"
Rename-Item -Path $imageRawPath -NewName "$($stepAmount)_$($authorName)_$($newModelName)"

# Change the kohya_ss settings to automatically use new folders
$configFileContent = Get-Content -Path ($destinationFolder + "\settings.json") -Raw
#todo change \ to /
$configFileContent = $configFileContent -replace('logdir', ($destinationFolder + "\log") -replace ("\\", "/")) 
$configFileContent = $configFileContent -replace('traindir', ($destinationFolder + "\image") -replace ("\\", "/")) 
$configFileContent = $configFileContent -replace('outputdir', ($destinationFolder + "\image") -replace ("\\", "/")) 
$configFileContent = $configFileContent -replace('outputname', ($authorName + "_" + $newModelName) -replace ("\\", "/")) 
$configFileContent = $configFileContent -replace('sourcemodelPath', $defaultSourcemodelPath -replace ("\\", "/")) 
Set-Content -Path ($destinationFolder + "\settings.json") -Value $configFileContent