# Home Assistant Helpers

## Current Sensor & Zone Setup Notes
1. **Office:** Presence sensor with two zones and keep-on zones  
2. **Living room:** Presence sensor with two zones and keep-on zones  
3. **Bathroom:** Keep-on with two motion sensors  
4. **Kitchen:** One presence sensor with zones - each zone connects to one light exactly

---

## Bedroom Helpers
### Bedroom Bed Led Color Temp  
- **Entity ID:** `input_number.bedroom_bed_led_color_temp`  
- **Type:** Input number  

### Bedroom Bed Led Sensors Enable  
- **Entity ID:** `input_boolean.bedroom_bed_led_sensors_enable`  
- **Type:** Input boolean  

### Bedroom Block Bed Leds  
- **Entity ID:** `binary_sensor.bedroom_block_bed_leds`  
- **Type:** Template  
- **Template:**  
  ```jinja
  {{ is_state('light.bedroom_yeelight_ceiling_light','on')
     or is_state('light.bedroom_yeelight_ceiling_ambilight','on')
     or is_state('binary_sensor.bedroom_tv_active','on') }}
  ```

---

## Global Room Light/Sensor Helpers

### Bathroom Mode  
- **Entity ID:** `input_select.bathroom_mode`  
- **Type:** Input select  
- **Options:** Auto, Day, Night, Off  

### Bathroom Sensors Enable  
- **Entity ID:** `input_boolean.bathroom_sensors_enable`  
- **Type:** Input boolean  

### Bedroom Mode  
- **Entity ID:** `input_select.bedroom_mode`  
- **Type:** Input select  
- **Options:** Auto, Day, Night, Off  

### Bedroom Sensors Enable  
- **Entity ID:** `input_boolean.bedroom_sensors_enable`  
- **Type:** Input boolean  

### Console Mode  
- **Entity ID:** `input_select.console_mode`  
- **Type:** Input select  
- **Options:** Auto, Day, Night, Off  

### Console Sensors Enable  
- **Entity ID:** `input_boolean.console_sensors_enable`  
- **Type:** Input boolean  

### Entrance Mode  
- **Entity ID:** `input_select.entrance_mode`  
- **Type:** Input select  
- **Options:** Auto, Day, Night, Off  

### Entrance Sensors Enable  
- **Entity ID:** `input_boolean.entrance_sensors_enable`  
- **Type:** Input boolean  

### Fourth Room Mode  
- **Entity ID:** `input_select.fourth_room_mode`  
- **Type:** Input select  
- **Options:** Auto, Day, Night, Off  

### Fourth Room Sensors Enable  
- **Entity ID:** `input_boolean.fourth_room_sensors_enable`  
- **Type:** Input boolean  

### Hallway Mode  
- **Entity ID:** `input_select.hallway_mode`  
- **Type:** Input select  
- **Options:** Auto, Day, Night, Off  

### Hallway Sensors Enable  
- **Entity ID:** `input_boolean.hallway_sensors_enable`  
- **Type:** Input boolean  

### Kitchen Mode  
- **Entity ID:** `input_select.kitchen_mode`  
- **Type:** Input select  
- **Options:** Auto, Day, Night, Off  

### Kitchen Sensors Enable  
- **Entity ID:** `input_boolean.kitchen_sensors_enable`  
- **Type:** Input boolean  

### Laundry Room Mode  
- **Entity ID:** `input_select.laundry_room_mode`  
- **Type:** Input select  
- **Options:** Auto, Day, Night, Off  

### Laundry Sensors Enable  
- **Entity ID:** `input_boolean.laundry_sensors_enable`  
- **Type:** Input boolean  

### Living Room Mode  
- **Entity ID:** `input_select.living_room_mode`  
- **Type:** Input select  
- **Options:** Auto, Day, Night, Off  

### Living Room Previous Mode  
- **Entity ID:** `input_select.living_room_previous_mode`  
- **Type:** Input select  

### Living Room Sensors Enable  
- **Entity ID:** `input_boolean.living_room_sensors_enable`  
- **Type:** Input boolean  

### Master Bathroom Mode  
- **Entity ID:** `input_select.master_bathroom_mode`  
- **Type:** Input select  
- **Options:** Auto, Day, Night, Off  

### Master Bathroom Sensors Enable  
- **Entity ID:** `input_boolean.master_bathroom_sensors_enable`  
- **Type:** Input boolean  

### Office Mode  
- **Entity ID:** `input_select.office_mode`  
- **Type:** Input select  
- **Options:** Auto, Day, Night, Off  

### Office Sensors Enable  
- **Entity ID:** `input_boolean.office_sensors_enable`  
- **Type:** Input boolean  

### Storage Room Mode  
- **Entity ID:** `input_select.storage_room_mode`  
- **Type:** Input select  
- **Options:** Auto, Day, Night, Off  

### Storage Room Sensors Enable  
- **Entity ID:** `input_boolean.storage_room_sensors_enable`  
- **Type:** Input boolean  

---

## Living Room Table Helpers
### Living Room Contact Override Active  
- **Entity ID:** `input_boolean.living_room_contact_override_active`  
- **Type:** Input boolean  

---

## Master Automation Helpers
### Automations Master Enable  
- **Entity ID:** `input_boolean.automations_master_enable`  
- **Type:** Input boolean  

### Global Day Override  
- **Entity ID:** `input_boolean.global_day_override`  
- **Type:** Input boolean  

### Partner Day Minutes  
- **Entity ID:** `input_number.partner_day_minutes`  
- **Type:** Input number  

### Partner Day Window  
- **Entity ID:** `timer.partner_day_window`  
- **Type:** Timer

### Global Lights Manual Override Timer  
- **Entity ID:** `timer.global_lights_manual_override_timer`  
- **Type:** Timer
- **Duration:** 1.5 minutes (00:01:30)
- **Purpose:** Shared timer for all room manual override states  

---

## Night Mode Helpers
### House Activity Excl Sleep Rooms  
- **Entity ID:** `binary_sensor.house_activity_excl_sleep_rooms`  
- **Type:** Group  
- **Members:**  
  - Bathroom Aqara P1 Motion Sensor (Bathroom)  
  - Bathroom Tub Aqara P1 Motion Sensor (Bathroom)  
  - Hallway Aqara P1 Motion Sensor (Hallway)  
  - Laundry Aqara P1 Motion Sensor (Laundry Room)  
  - Living Room Space (Living Room FP2)  
  - Sofa (Living Room FP2)  
  - Kitchen Space Aqara Presence Sensor FP2  
  - Console Aqara Presence Sensor FP2  
  - Entrance Aqara Presence Sensor FP2  
  - Storage Room Aqara P1 Motion Sensor  
  - Office Desk (Office FP2)  
  - Office Space (Office FP2)  
  - All (Fourth Room FP2)  

### Night Mode  
- **Entity ID:** `input_boolean.night_mode`  
- **Type:** Input boolean  

### Sonos Override Active  
- **Entity ID:** `input_boolean.sonos_override_active`  
- **Type:** Input boolean  

---

## Templates

### Bedroom TV Active  
```jinja
{{ states('media_player.lg_tv_oled55b9pva') not in ['off','unknown','unavailable'] }}
```

### Bedroom Space Light OK  
- **Entity ID:** `binary_sensor.bedroom_space_light_ok`
- **Type:** Template
- **Template:**
```jinja
{{ 
  is_state('binary_sensor.bedroom_aqara_presence_sensor_fp2_bedroom_space','on')
  and (
        is_state('media_player.lg_tv_oled55b9pva','off')
        or is_state('input_boolean.bedroom_allow_light_with_tv','on')
      )
  and is_state('input_boolean.night_mode','off')
}}
```

---

## Office PC Screen Automation Entities

### Office Chair Vibration Sensor
- **Entity ID:** `binary_sensor.office_chair_vibration_sensor` 
- **Type:** Vibration sensor
- **Placement:** On chair frame where neck cushion touches (detects leaning/typing movements)

### Office PC Screen Switch  
- **Entity ID:** `switch.office_pc_screen`
- **Type:** Smart plug switch
- **Purpose:** Controls office PC screen power

### Office Work Mode (Helper needed)
- **Entity ID:** `input_boolean.office_work_mode` 
- **Type:** Input boolean
- **Purpose:** Tracks if currently in active work session

### Office Maintenance Mode (Helper needed)
- **Entity ID:** `input_boolean.office_maintenance_mode` 
- **Type:** Input boolean
- **Purpose:** Temporary block for screen activation during brief chair movements

---

## Office Work Automation Blueprint ✅ **WORKING**
- **GitHub Repository:** https://github.com/golanbendor-cpu/home-assistant-blueprints
- **Purpose:** Smart PC screen + Day mode control via chair vibration detection ONLY
- **Status:** ✅ **CONFIRMED WORKING** with instant chair vibration response
- **Logic:** 
  - **ONLY chair vibrations trigger work** (no desk presence backup)
  - **Smart state handling:** Handles both new sessions and resuming after Alexa shutdown
  - **Auto cleanup:** Work mode resets when PC turned off externally OR office exited
  - **Safety check:** Requires desk presence to prevent false vibration triggers

### Working Home Assistant Configuration:
```yaml
alias: Office Work Automation (PC Screen + Day Mode)
description: ""
use_blueprint:
  path: golanbendor-cpu/office_work_automation.yaml
  input:
    chair_vibration_sensor: binary_sensor.office_chair_vibration_sensor
    desk_presence_sensor: binary_sensor.office_aqara_presence_sensor_fp2_office_desk
    office_space_sensor: binary_sensor.office_aqara_presence_sensor_fp2_office_space
    pc_screen_switch: switch.office_pc_screen
    office_mode_select: input_select.office_mode
    maintenance_mode_toggle: input_boolean.office_maintenance_mode_toggle
    work_mode_toggle: input_boolean.office_work_mode_toggle
    office_exit_delay: 1
```

- **Key Fix:** Uses `switch.office_pc_screen` (not device ID `switch.10012e042f`)
- **Reverted optimization:** Removed "do nothing" case that broke PC activation - needs proper condition-level filtering

---

## Blueprint Gist URLs & Status

### Room Presence Plus Blueprint ✅ **WORKING**
- **GitHub Repository:** https://github.com/golanbendor-cpu/home-assistant-blueprints
- **Purpose:** Advanced room lighting automation with manual override protection
- **Key Features:**
  - Night dimming curves (70% → 3% moonlight) with proper end state
  - 90-second manual override timer (global shared timer)
  - Yeelight normal/moonlight mode switching
  - Multi-sensor support (FP2 + PIR motion)
  - TV integration and global state management

### Office Work Automation Blueprint ✅ **WORKING**  
- **GitHub Repository:** https://github.com/golanbendor-cpu/home-assistant-blueprints
- **Purpose:** Smart PC screen + Day mode control via chair vibration detection ONLY
- **Key Features:**
  - Instant chair vibration response (no desk presence backup)
  - Smart state handling (3 cases: new session, resume after Alexa, already working)
  - Auto cleanup on office exit or external PC shutdown
  - Safety desk presence check prevents false triggers

---

## Entity Relationships & Logic

### Global Shared Entities
- `timer.global_lights_manual_override_timer` - 90-second shared timer for ALL room manual overrides
- `input_boolean.automations_master_enable` - Master enable/disable for all automations
- `input_boolean.night_mode` - House-wide night mode state
- `input_boolean.global_day_override` - Partner day override for house-wide lighting

### Office Work Session Logic
1. **Chair vibration sensor fires** → Check desk presence (safety)
2. **Work mode OFF + PC screen any state** → Turn on PC + Day mode + work mode ON
3. **Work mode ON + PC screen OFF** → Turn PC back on + ensure Day mode (Alexa recovery)
4. **Work mode ON + PC screen ON** → Do nothing (optimization - already working)
5. **Office exit 1+ minutes** → PC off + Auto mode + work mode OFF
6. **PC turned off externally** → Auto-reset work mode OFF + Auto mode

### Room Presence Plus Logic  
1. **Presence detected** → Check room mode (Auto/Day/Night/Off)
2. **Auto mode + day time** → Turn lights on normal brightness
3. **Auto mode + night dimming window** → Start dimming curve (70% → 3%)
4. **Manual light change** → Start global override timer, suspend automation
5. **Override timer expires** → Resume automation based on current presence
6. **TV state changes** → Adjust lighting behavior per room configuration

---

## Office Work Automation Helpers

### Office Work Mode Toggle
- **Entity ID:** `input_boolean.office_work_mode`
- **Type:** Input boolean
- **Purpose:** Tracks if currently in work session
- **Used by:** Office Work Automation blueprint

### Office Maintenance Mode Toggle  
- **Entity ID:** `input_boolean.office_maintenance_mode`
- **Type:** Input boolean
- **Purpose:** Temporary block for brief movements (prevents false triggers)
- **Used by:** Office Work Automation blueprint

### Vibration Verification Time
- **Entity ID:** `input_number.office_vibration_verification_time`
- **Type:** Input number
- **Range:** 15-120 seconds  
- **Default:** 30 seconds
- **Purpose:** Time to wait for more vibrations after PC turns on (confirms work)
- **Used by:** Office Work Automation blueprint

### Vibration Cooldown
- **Entity ID:** `input_number.office_vibration_cooldown`
- **Type:** Input number
- **Range:** 1-10 seconds
- **Default:** 3 seconds  
- **Purpose:** Prevent rapid on/off cycling from multiple vibrations
- **Used by:** Office Work Automation blueprint
