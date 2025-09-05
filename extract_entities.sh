#!/bin/bash
# Extract all entities, devices, and helpers from YAML files
# This creates a comprehensive list for Claude to remember your setup

echo "# Home Assistant Entities, Devices & Helpers" > entities_summary.md
echo "Generated: $(date)" >> entities_summary.md
echo "" >> entities_summary.md

echo "## Device IDs" >> entities_summary.md
echo "```" >> entities_summary.md
grep -r "device_id:" automations/ blueprints/ 2>/dev/null | sed 's/.*device_id: *//' | sort -u >> entities_summary.md
echo "```" >> entities_summary.md
echo "" >> entities_summary.md

echo "## Input Booleans" >> entities_summary.md
echo "```" >> entities_summary.md
grep -r "input_boolean\." automations/ blueprints/ scripts/ 2>/dev/null | sed 's/.*input_boolean\./input_boolean./' | sed 's/[^a-zA-Z0-9_.].*$//' | sort -u >> entities_summary.md
echo "```" >> entities_summary.md
echo "" >> entities_summary.md

echo "## Input Selects" >> entities_summary.md
echo "```" >> entities_summary.md
grep -r "input_select\." automations/ blueprints/ scripts/ 2>/dev/null | sed 's/.*input_select\./input_select./' | sed 's/[^a-zA-Z0-9_.].*$//' | sort -u >> entities_summary.md
echo "```" >> entities_summary.md
echo "" >> entities_summary.md

echo "## Input Numbers" >> entities_summary.md
echo "```" >> entities_summary.md
grep -r "input_number\." automations/ blueprints/ scripts/ 2>/dev/null | sed 's/.*input_number\./input_number./' | sed 's/[^a-zA-Z0-9_.].*$//' | sort -u >> entities_summary.md
echo "```" >> entities_summary.md
echo "" >> entities_summary.md

echo "## Binary Sensors" >> entities_summary.md
echo "```" >> entities_summary.md
grep -r "binary_sensor\." automations/ blueprints/ scripts/ 2>/dev/null | sed 's/.*binary_sensor\./binary_sensor./' | sed 's/[^a-zA-Z0-9_.].*$//' | sort -u >> entities_summary.md
echo "```" >> entities_summary.md
echo "" >> entities_summary.md

echo "## Lights" >> entities_summary.md
echo "```" >> entities_summary.md
grep -r "light\." automations/ blueprints/ scripts/ 2>/dev/null | sed 's/.*light\./light./' | sed 's/[^a-zA-Z0-9_.].*$//' | sort -u >> entities_summary.md
echo "```" >> entities_summary.md
echo "" >> entities_summary.md

echo "## Media Players" >> entities_summary.md
echo "```" >> entities_summary.md
grep -r "media_player\." automations/ blueprints/ scripts/ 2>/dev/null | sed 's/.*media_player\./media_player./' | sed 's/[^a-zA-Z0-9_.].*$//' | sort -u >> entities_summary.md
echo "```" >> entities_summary.md
echo "" >> entities_summary.md

echo "## Switches" >> entities_summary.md
echo "```" >> entities_summary.md
grep -r "switch\." automations/ blueprints/ scripts/ 2>/dev/null | sed 's/.*switch\./switch./' | sed 's/[^a-zA-Z0-9_.].*$//' | sort -u >> entities_summary.md
echo "```" >> entities_summary.md
echo "" >> entities_summary.md

echo "## Timers" >> entities_summary.md
echo "```" >> entities_summary.md
grep -r "timer\." automations/ blueprints/ scripts/ 2>/dev/null | sed 's/.*timer\./timer./' | sed 's/[^a-zA-Z0-9_.].*$//' | sort -u >> entities_summary.md
echo "```" >> entities_summary.md
echo "" >> entities_summary.md

echo "## Groups" >> entities_summary.md
echo "```" >> entities_summary.md
grep -r "group\." automations/ blueprints/ scripts/ 2>/dev/null | sed 's/.*group\./group./' | sed 's/[^a-zA-Z0-9_.].*$//' | sort -u >> entities_summary.md
echo "```" >> entities_summary.md

echo "" >> entities_summary.md
echo "---" >> entities_summary.md
echo "Generated from automations/, blueprints/, and scripts/ folders" >> entities_summary.md