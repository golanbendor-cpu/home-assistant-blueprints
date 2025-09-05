@echo off
echo Extracting all entities from YAML files...

echo # Entity Extraction Results > entity_results.txt
echo Generated: %DATE% %TIME% >> entity_results.txt
echo. >> entity_results.txt

echo ## Device IDs >> entity_results.txt
findstr /R /S "device_id:" automations\*.yaml blueprints\*.yaml 2>nul >> entity_results.txt
echo. >> entity_results.txt

echo ## Input Booleans >> entity_results.txt  
findstr /R /S "input_boolean\." automations\*.yaml blueprints\*.yaml scripts\*.yaml 2>nul >> entity_results.txt
echo. >> entity_results.txt

echo ## Input Selects >> entity_results.txt
findstr /R /S "input_select\." automations\*.yaml blueprints\*.yaml scripts\*.yaml 2>nul >> entity_results.txt
echo. >> entity_results.txt

echo ## Lights >> entity_results.txt
findstr /R /S "light\." automations\*.yaml blueprints\*.yaml scripts\*.yaml 2>nul >> entity_results.txt
echo. >> entity_results.txt

echo ## Binary Sensors >> entity_results.txt
findstr /R /S "binary_sensor\." automations\*.yaml blueprints\*.yaml scripts\*.yaml 2>nul >> entity_results.txt
echo. >> entity_results.txt

echo ## Switches >> entity_results.txt
findstr /R /S "switch\." automations\*.yaml blueprints\*.yaml scripts\*.yaml 2>nul >> entity_results.txt
echo. >> entity_results.txt

echo Entity extraction complete! Check entity_results.txt