# Home Assistant Devices, Entities & Helpers Reference

> **Purpose:** Complete reference for Claude to remember all your devices and entities for better assistance

## Device IDs (ZHA/Zigbee)

### Button/Switch Devices
- **`9c061be1eb7a3ec725a43e090d619e01`** - Bedroom Button (Sleep/Sonos control)
- **`2c7ae4a720068cfa4cdf96f6a26f418c`** - Kitchen Partner Day Button
- **`64785745f5c2df63e5bc26152bdf6903`** - Device ID (identify location)
- **`73d53367f0a31f66f52d4a5f26194da0`** - Device ID (identify location)

## Room Sensors & Zones

### FP2 Presence Sensors (12 Rooms)
- **Living Room:** FP2 with 2 zones + keep-on zones
- **Office:** FP2 with 2 zones + keep-on zones  
- **Kitchen:** FP2 with kitchen bar zone
- **Console:** FP2 presence
- **Fourth Room:** FP2 presence
- **Entrance:** FP2 presence

### Motion Sensors
- **Bathroom:** 2 motion sensors (dual detection)
- **Master Bathroom:** Motion sensor
- **Hallway:** Motion sensor  
- **Laundry:** Motion sensor
- **Storage:** Motion sensor

### Special Sensors
- **Office Chair:** Vibration sensor (`binary_sensor.office_chair_vibration`)
- **Office Desk:** Presence sensor (`binary_sensor.office_desk_presence`)
- **Office Space:** Presence sensor (`binary_sensor.office_space_presence`)
- **Bedroom TV:** TV active sensor (`binary_sensor.bedroom_tv_active`)
- **Bedroom Bed:** Bed occupancy sensor

## Lighting Entities

### Room Ceiling Lights
- `light.living_room_ceiling_light` + ambilight
- `light.bedroom_yeelight_ceiling_light` + ambilight  
- `light.office_ceiling_light`
- `light.kitchen_ceiling_light`
- `light.console_ceiling_light`
- `light.fourth_room_ceiling_light`
- `light.entrance_ceiling_light`
- `light.master_bathroom_ceiling_light`
- `light.hallway_ceiling_light`
- `light.bathroom_ceiling_light`
- `light.laundry_ceiling_light`
- `light.storage_ceiling_light`

### LED Strips & Special Lights
- `light.bedroom_led_left` - Left bedside LED strip
- `light.bedroom_led_right` - Right bedside LED strip

## Input Helpers

### Global Controls
- `input_boolean.automations_master_enable` - Global automation kill switch
- `input_boolean.night_mode` - House-wide sleep mode
- `input_boolean.global_day_override` - Partner day override
- `timer.global_lights_manual_override_timer` - 1.5min manual override timer
- `timer.partner_day_window` - Partner day timer
- `input_number.partner_day_minutes` - Partner day duration

### Per-Room Controls (12 Rooms)
Pattern: `input_boolean.{room}_sensors_enable` + `input_select.{room}_mode`

- **Living Room:** `input_boolean.living_room_sensors_enable`, `input_select.living_room_mode`
- **Bedroom:** `input_boolean.bedroom_sensors_enable`, `input_select.bedroom_mode`  
- **Office:** `input_boolean.office_sensors_enable`, `input_select.office_mode`
- **Kitchen:** `input_boolean.kitchen_sensors_enable`, `input_select.kitchen_mode`
- **Console:** `input_boolean.console_sensors_enable`, `input_select.console_mode`
- **Fourth Room:** `input_boolean.fourth_room_sensors_enable`, `input_select.fourth_room_mode`
- **Entrance:** `input_boolean.entrance_sensors_enable`, `input_select.entrance_mode`
- **Master Bathroom:** `input_boolean.master_bathroom_sensors_enable`, `input_select.master_bathroom_mode`
- **Hallway:** `input_boolean.hallway_sensors_enable`, `input_select.hallway_mode`
- **Bathroom:** `input_boolean.bathroom_sensors_enable`, `input_select.bathroom_mode`
- **Laundry:** `input_boolean.laundry_room_sensors_enable`, `input_select.laundry_room_mode`
- **Storage:** `input_boolean.storage_sensors_enable`, `input_select.storage_mode`

### Bedroom LED Controls
- `input_boolean.bedroom_bed_led_sensors_enable` - LED automation enable
- `input_number.bedroom_bed_led_color_temp` - LED color temperature
- `input_select.bedroom_bed_led_color_mode` - LED color mode
- `input_number.bedroom_bed_led_brightness` - LED brightness
- `binary_sensor.bedroom_block_bed_leds` - LED blocking logic template

### Office Work Automation
- `input_boolean.office_work_mode` - Work session tracker
- `input_boolean.office_maintenance_mode` - Maintenance mode toggle
- `input_number.office_vibration_verification_time` - Vibration verification period (30s)
- `input_number.office_vibration_cooldown` - Vibration cooldown period (3s)

### Sonos & Media Controls
- `input_boolean.sonos_override_active` - Sonos state management
- `media_player.bedroom_sonos_beam` - Bedroom Sonos speaker
- `media_player.lg_tv_oled55b9pva` - Bedroom LG TV
- `switch.office_pc_screen` - Office PC screen control

## Groups
- `group.house_activity_excl_sleep_rooms` - House activity excluding bedrooms

## Scripts
- `script.turn_on_bedroom_tv_improved` - Enhanced TV wake-up with WOL

## Activity Patterns

### Blueprint-Based Automations (12 Rooms)
Each room uses `room_presence_plus.yaml` blueprint with:
- Presence/motion triggers
- Mode selection (Auto/Day/Night/Off)
- Manual override protection
- Night dimming curves
- Partner day integration

### Specialized Automations  
- **Bedroom Button:** Sleep mode + Sonos control
- **Kitchen Button:** Partner day control
- **Living Room Table:** Contact force day mode
- **Bedroom Bed:** Presence → TV on, mode off
- **Office Work:** Chair vibration → PC + day mode
- **Bedroom LEDs:** Night guidance with TV/ceiling guards

---

**Last Updated:** $(date)
**Auto-Generated:** Use `bash extract_entities.sh` to refresh this file