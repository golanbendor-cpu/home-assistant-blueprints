# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview
This is a comprehensive Home Assistant configuration for a real house automation system. The project includes helpers, automations, scripts, blueprints, bug tracking, and feature requests for managing room-based lighting, presence detection, and media controls across multiple rooms.

### **Project Organization (Updated)**
- **Git Repository:** This entire folder is now a Git repository for version control
- **Blueprint Sharing:** Public templates available in `public_gist_templates/` (safe for sharing)
- **Private Automation Files:** All working automations in `automations/` and `blueprints/` (contains device IDs - keep private)
- **Security Protection:** `.gitignore` prevents sensitive data from being committed
- **GitHub Desktop Ready:** Repository ready for GitHub Desktop integration

## Claude Code Permissions
- **Full read access** to all files in this project without asking permission
- **Full edit access** to all blueprints, automations, scripts, and markdown files without asking permission
- **Automatic updates** to bugs.md and CLAUDE.md when bugs are fixed or features are implemented
- **Blueprint testing** should be done via Home Assistant configuration validation commands before deployment

## Documentation Usage for Claude
When helping with Home Assistant tasks, **always reference these comprehensive documentation files**:
- **`entities.md`** - When working with any entities, sensors, lights, or helpers
- **`devices.md`** - When dealing with device IDs, MAC addresses, or hardware references
- **`automations_blueprint.md`** - When creating, modifying, or troubleshooting automations
- **`helpers.md`** - When configuring input helpers or understanding room patterns
- These files contain **complete, up-to-date information** extracted from all YAML files

## Architecture & Structure

### Core Components
- **Blueprints** (`blueprints/`): Reusable automation templates (GitHub public)
  - `room_presence_plus.yaml`: Main blueprint for unified presence/motion lighting with per-room modes
  - `bedroom_led_blueprint.yaml`: Specialized bedside LED strip control with TV/ceiling guards
  - `office_work_automation.yaml`: Smart PC screen + Day mode control via chair vibration
- **Automation Instances** (`automations/blueprints/`): Blueprint-based automations (local only)
  - `room_presence_plus/`: 12 room automation instances using the room presence blueprint
  - `bedroom_led_blueprint/`: LED automation instances using the LED blueprint
- **Specialized Automations** (`automations/specialized/`): Regular automations (local only)
  - `bedroom/`: Button controls, bed presence, sleep/sonos automations
  - `kitchen/`: Partner day button control
  - `living_room/`: Table contact automation
  - `partner_day/`: Daily reset automation
- **Scripts** (`scripts/scripts.yaml`): Utility scripts for device control (e.g., bedroom TV CEC/WOL)
- **Documentation Files** (comprehensive references for Claude):
  - `helpers.md`: Input booleans, selects, numbers, and timers that control automation behavior
  - `entities.md`: Complete entity reference across all domains (100+ entities)
  - `devices.md`: Device IDs, MAC addresses, and hardware inventory
  - `automations_blueprint.md`: Detailed automation and blueprint documentation

### Room-Based Architecture
Each room follows a standardized pattern with these helpers:
- `input_select.{room}_mode`: Controls automation mode (Auto/Day/Night/Off)
- `input_boolean.{room}_sensors_enable`: Master switch for room sensors
- Room-specific sensors and lights connected via the `room_presence_plus.yaml` blueprint

### Master Control System
- `input_boolean.automations_master_enable`: Global kill switch for all automations
- `input_boolean.night_mode`: House-wide night mode affecting all rooms
- `input_boolean.global_day_override`: Partner day override system
- `timer.partner_day_window`: Time-based partner day window control

## Key Automation Patterns

### Presence-Based Lighting
The core automation pattern uses the `room_presence_plus.yaml` blueprint which provides:
- Presence zone detection with keep-on zones
- Auto/Day/Night/Off mode selection per room
- Lux-based triggering with configurable thresholds  
- Night dimming with brightness-only changes
- Yeelight support with normal/moonlight modes
- Ambilight control that turns off during activity
- Sleep mode safety features to prevent bedroom light activation

### Helper Relationships
- **Bedroom-specific**: Bed LED helpers work with bedroom presence automation
- **Living Room**: Contact override system for table-based controls
- **Night Mode**: House activity sensors exclude sleep rooms from night mode triggering
- **Partner Day**: Timer-based system with manual override capabilities

## Development Workflow

### Creating New Automations 

#### For Blueprint-Based Automations:
1. **Import blueprint** from GitHub repository into Home Assistant
2. **Create automation instance** using the blueprint in Home Assistant
3. **Configure parameters** with real device IDs and entities
4. **Copy resulting YAML** to `automations/blueprints/{blueprint_name}/` for backup

#### For Specialized Automations:
1. **Create automation** directly in Home Assistant or YAML editor
2. **Test thoroughly** using automation traces and manual triggers
3. **Copy YAML** to `automations/specialized/{room}/` folder for version control
4. **Update documentation** in relevant markdown files

#### Documentation Updates:
- Add automation details to appropriate markdown files
- Update `helpers.md` if new helpers are created  
- Cross-reference with existing automations and blueprints
- Commit changes to local Git for version control

### Blueprint Usage Guidelines
- Use `room_presence_plus.yaml` for standard room lighting automation
- Configure presence_zones, keep_on_zones, main_light, and ambilight_entity
- Set appropriate lux thresholds and off delays per room
- Always connect to room-specific mode and enable helpers

### Development Workflow - Git & Blueprint Sharing Strategy

**GITHUB BLUEPRINT REPOSITORY (Public - Templates Only):**
Blueprint templates are managed in GitHub for public sharing:
```bash
# After making changes to blueprint templates:
git add blueprints/*.yaml
git commit -m "Description of changes

🤖 Generated with Claude Code"
git push  # Push blueprint templates to GitHub repository
```

**SECURITY PROTECTIONS IN PLACE:**
- **`.gitignore` excludes:** `automations/` folder (contains device IDs)  
- **`.gitignore` excludes:** `traces/` folder (contains debug info)
- **`.gitignore` excludes:** `blueprints/*_gist/` folders (old Gist repos with device IDs)
- **Blueprint sanitization:** Device IDs replaced with placeholders like `YOUR_DEVICE_ID_HERE`
- **Public safe:** Only sanitized `blueprints/*.yaml` files are committed to GitHub

**MIGRATION FROM GIST TO GITHUB:**
- ✅ **Blueprints now in GitHub:** Main blueprint files are in the public repository
- ✅ **Device IDs sanitized:** All device IDs replaced with placeholders  
- ✅ **Automations protected:** Private automation files stay local only
- ✅ **Security maintained:** `.gitignore` prevents sensitive data commits

**GITHUB REPOSITORY:**
- **Repository URL:** https://github.com/golanbendor-cpu/home-assistant-blueprints
- **GitHub Username:** golanbendor-cpu
- **GitHub Token:** [STORED IN IGNORED FILE] (see `github_credentials.md` - local only)

**WORKFLOW SUMMARY:**
1. **Blueprint Templates** → GitHub (public, sanitized)
2. **Blueprint Instances** → Local only (`automations/blueprints/`)  
3. **Specialized Automations** → Local only (`automations/specialized/`)
4. **Local Git** → Tracks everything for version control
5. **GitHub** → Only gets blueprint templates for sharing

**SECURITY CRITICAL:**
- ❌ **NEVER commit files from `automations/`** (contain actual device IDs)
- ❌ **NEVER commit files from `traces/`** (contain debug information)  
- ✅ **Blueprint templates are safe for GitHub** (device IDs sanitized)
- 🛡️ **`.gitignore` protects all sensitive data** from accidental commits

### Helper Management
- Check `helpers.md` for existing helpers before creating new ones
- Follow naming convention: `input_{type}.{room}_{purpose}`
- **Always update `helpers.md`** with new helper documentation including related automations
- **Update relevant documentation files** when adding new components:
  - Add new helpers to `helpers.md` with entity ID, type, and usage
  - Document new automations in individual folders with markdown files
  - Add bug reports to `bugs.md` if issues are discovered
  - Update `new_features.md` when implementing requested features

## Configuration Validation

### Build and Test Commands
These commands validate Home Assistant configuration files before deployment:

```bash
# Local Home Assistant Core validation (if HA Core installed locally)
python -m homeassistant --script check_config -c .
# or
hass --script check_config -c .

# Docker-based validation (recommended - works without local HA installation)
docker run --rm -v ${PWD}:/config ghcr.io/home-assistant/home-assistant:stable python -m homeassistant --script check_config -c /config

# Local testing via Docker (starts HA instance for testing)
docker run -it --rm -v ${PWD}:/config -p 8123:8123 ghcr.io/home-assistant/home-assistant:stable

# Home Assistant Supervisor CLI (if using Home Assistant OS/Supervised)
ha core check
ha core restart
```

**Always run config validation after any changes to YAML files before committing or deploying.**

### Quality Checks
- Always run config validation before implementing changes
- Use Home Assistant's Automation Trace for debugging triggers/conditions/actions
- Check `bugs.md` for known issues that might affect new implementations
- Verify lux sensor readings and presence sensor behavior in target rooms

### Development & Debugging Guidelines
**CRITICAL: Before creating/modifying any automation, script, or blueprint:**

1. **Check for Breaking Changes**:
   - Review existing automations that might be affected
   - Verify helper entities are not used elsewhere
   - Test using HA config validation commands before deploying

2. **Use Existing Helpers**:
   - Always check `helpers.md` for existing helpers before creating new ones
   - Follow established naming conventions: `input_{type}.{room}_{purpose}`
   - Reuse master control helpers: `automations_master_enable`, `night_mode`, `global_day_override`

3. **Blueprint Testing & Validation**:
   - Run config validation commands before deployment (see Build and Test Commands section)
   - Use **Developer Tools > States** to check entity states
   - Use **Automation Trace** to identify where execution stops
   - Check motion/presence sensor responsiveness manually
   - Verify light entities work with manual control
   - Test all triggers: presence, motion, mode changes, time events

4. **Automatic Documentation Updates**:
   - When bugs are fixed, automatically update bugs.md with ✅ FIXED status and solution
   - When features are implemented from new_features.md, mark as completed
   - Update CLAUDE.md when architectural changes are made

5. **Manual Override Design Principles** (INTENDED BEHAVIOR - NOT BUGS):
   - **Manual Turn-ON**: 1.5 minute automation pause, then resume normal automation
   - **Manual Turn-OFF**: Immediate automation resume, no delays
   - **Global mode changes**: Always override manual settings (night mode, partner day win)
   - **Night dimming**: Continues during manual override (gradual dimming preserved)
   - **Purpose**: Simple on/off control, not complex dimming or per-room coordination

6. **Multi-Automation Integration Patterns** (INTENDED BEHAVIOR - NOT BUGS):
   - **Bedroom**: Bed presence sets mode Off → Presence Plus respects it (sleep priority)
   - **Living Room**: Table contact forces Day mode → Presence Plus follows (eating needs light)
   - **Bedroom LEDs**: Only activate when TV off + no ceiling lights + night mode (ambiance lighting)
   - **Global Night Mode**: Wins over all room modes (house-wide sleep priority)
   - **Global Day Override**: Wins over night mode in selected rooms (partner day flexibility)
   - **Automation layering**: Specialized automations control modes, main automations follow modes

7. **Known Blueprint Issues** (check bugs.md for current status):
   - ✅ **Night dimming transitions**: FIXED - Added transition parameters for smooth dimming  
   - ✅ **Manual override detection**: FIXED - Added external_main_off trigger for complete manual control
   - **Light turn-off reliability**: Lights not turning off consistently when expected

## Documentation Management & Feature Tracking

### Documentation Update Requirements
**CRITICAL: When adding any new component, you MUST update these files:**
1. **`helpers.md`** - Add new helpers with entity ID, type, description, and related automations
2. **Individual automation folders** - Create markdown files documenting what was added/changed
3. **`bugs.md`** - Add any discovered issues during implementation
4. **`added_features.md`** - Mark features as completed when implemented

### Feature Implementation Workflow
1. **Check `future_features.md`** for requested features to implement
2. **Implement the feature** using existing patterns and blueprints
3. **Update documentation** as specified above
4. **Mark feature as completed** in `added_features.md` with implementation details
5. **Run configuration validation** to ensure no errors

### Current Known Issues (`bugs.md`)
- P1 issues include bedroom bed light delays, room entrance flickers, night dimming problems
- Most issues relate to `room_presence_plus.yaml` automation timing
- Bathroom dual motion sensor flickering
- Keep-on zone momentary off/on cycling

### Feature Requests (`future_features.md`)
- Living room sofa presence with TV/app integration
- House-wide scene buttons (Red Lights, Mood scenes)
- Office behaviors with RGB lighting and computer integration  
- LG TV and media controls with sleep brightness

### Creating New Blueprints
**For new blueprints:**
1. **Create blueprint** in main `blueprints/` folder
2. **Sanitize sensitive data:** Replace any device IDs with placeholders like `YOUR_DEVICE_ID_HERE`
3. **Commit to GitHub:** Use standard git workflow to commit sanitized blueprints
4. **Test locally:** Import blueprint in Home Assistant and configure with actual device IDs
5. **Update documentation:** Add blueprint details to relevant markdown files

### CLAUDE.md Maintenance
**This CLAUDE.md file should be updated when:**
- New architectural patterns are established
- New blueprint templates are created
- Build/test commands change
- Documentation structure changes
- New development workflows are established

## File Organization
- Use lowercase `snake_case` for all filenames and entity IDs
- Blueprint files: `{area}_{purpose}.yaml`
- Helper entities: `{domain}.{room}_{function}`
- Automation aliases should be descriptive and match room/function

## GUI Configuration Notes
Since you prefer GUI configuration:
1. Use Home Assistant's Automation UI to create automations
2. Reference blueprints through the UI's blueprint selector
3. Helper entities can be created through Settings > Devices & Services > Helpers
4. Test automations using the Trace feature in Developer Tools
5. Always validate configuration changes through the Configuration panel

## Troubleshooting
- Check `traces/` folder for uploaded diagnostic files (currently empty)
- Use Automation Trace to debug trigger/condition failures
- Verify helper states in Developer Tools > States
- Check entity availability and connectivity for presence sensors
- Confirm Yeelight integration status for lighting controls