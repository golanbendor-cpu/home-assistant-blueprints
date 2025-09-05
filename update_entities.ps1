# PowerShell script to extract entities and update devices.md
Write-Host "Extracting entities from YAML files..."

# Get all unique input_boolean entities
$inputBooleans = Select-String -Path "automations\*.yaml", "blueprints\*.yaml", "scripts\*.yaml" -Pattern "input_boolean\." -AllMatches | 
    ForEach-Object { $_.Line -replace '.*input_boolean\.([a-zA-Z0-9_]+).*', 'input_boolean.$1' } | 
    Sort-Object -Unique

# Get all unique input_select entities  
$inputSelects = Select-String -Path "automations\*.yaml", "blueprints\*.yaml", "scripts\*.yaml" -Pattern "input_select\." -AllMatches |
    ForEach-Object { $_.Line -replace '.*input_select\.([a-zA-Z0-9_]+).*', 'input_select.$1' } |
    Sort-Object -Unique

# Get all unique light entities
$lights = Select-String -Path "automations\*.yaml", "blueprints\*.yaml", "scripts\*.yaml" -Pattern "light\." -AllMatches |
    ForEach-Object { $_.Line -replace '.*light\.([a-zA-Z0-9_]+).*', 'light.$1' } |
    Sort-Object -Unique

Write-Host "Found:"
Write-Host "- $($inputBooleans.Count) input_boolean entities"
Write-Host "- $($inputSelects.Count) input_select entities" 
Write-Host "- $($lights.Count) light entities"

Write-Host "`nSample entities found:"
Write-Host "Input Booleans:" $inputBooleans[0..4]
Write-Host "Lights:" $lights[0..4]

Write-Host "`nEntity extraction complete! Use these results to update devices.md"