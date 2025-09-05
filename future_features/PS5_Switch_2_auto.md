# Home Assistant Automation Plan: TVs + HDMI Matrix + Consoles

## Devices
1. TVs
  1. Bedroom TV
  2. Sofa TV in Living Room
  3. Office TV
2. Consoles
  1. Sony PS5
  2. Nintendo Switch
3. Control
  1. HDMI matrix controlled by Office Harmony Hub
    1. Matrix Sony routes PS5
    2. Matrix Nintendo routes Switch
4. Sensors
  1. Presence sensors in Bedroom, Living Room sofa zone, Office
  2. Contact sensors on remotes
    1. PS5 controller remote
    2. Switch controller remote
5. Helpers
  1. input_boolean manual_mode
  2. input_select per TV default input
  3. input_boolean room_gaming_mode for Bedroom
  4. input_boolean room_gaming_mode for Living Room
  5. input_boolean room_gaming_mode for Office
  6. input_boolean room_light_automations_enable per room
  7. binary_sensor office_pc_screen

## Core Automations
1. Presence based TV power
  1. Each TV has its own automation
  2. Presence detected in room powers on that room TV
  3. No presence for X minutes powers off that room TV
  4. Office TV rule
    1. If Office TV powers up and office_pc_screen is on, turn off office_pc_screen
    2. If office_pc_screen turns on while Office TV is active, turn off office_pc_screen

2. Remote pickup
  1. Contact sensor opens for PS5 or Switch remote
  2. Harmony Hub starts corresponding matrix activity
    1. PS5 uses Matrix Sony
    2. Switch uses Matrix Nintendo
  3. Active room determined by current presence
    1. Power on that room TV if off
    2. Switch TV input to the active console
  4. Office exception
    1. Office TV has priority and forces office_pc_screen off when needed

3. Multi room continuity while moving
  1. If a console is active and presence appears in another room
    1. Power on that room TV
    2. Switch TV input to the active console
  2. Previous room TV powers off after its no presence timeout

4. Remote put back
  1. Contact sensor closes
  2. Turn off the corresponding console
  3. Stop or power down the HDMI matrix route or activity
  4. TV input returns to default or last non console input
  5. TV powers off if no other presence based activity keeps it on

## Gaming Mode feature
1. Purpose
  1. Enable room_gaming_mode when gaming starts in a room
  2. Disable room light automations and apply gaming scene
  3. When no presence is detected return the room to auto mode
2. Entry
  1. Trigger on remote pickup of PS5 or Switch while presence is in Room R
  2. Turn on room_gaming_mode for Room R
  3. Turn off room_light_automations_enable for Room R
3. While active
  1. Presence based TV power remains active
  2. Input switching follows the active console with debounce
  3. Normal light automations in Room R are suppressed
4. Exit
  1. When Room R has no presence for Y minutes
    1. Turn off room_gaming_mode
    2. Turn on room_light_automations_enable
    3. Restore previous light state or apply room default
    4. If the console is still on perform fallback shutdown and stop matrix route
  2. Manual exit allowed via room_gaming_mode toggle

## Rules and Policies
1. Conflict policy
  1. If both remotes are picked at once the user manages manually
2. Manual override
  1. input_boolean manual_mode suppresses TV and matrix switching
3. Fallback and safety
  1. If a console remains on with no presence in any room for Y minutes perform shutdown of console and matrix route
  2. Debounce room transitions with 5 to 10 seconds delay
  3. On Home Assistant restart reconcile Harmony activity, matrix route, and TV inputs with sensors
4. Office priority rule
  1. Office TV always wins over Office PC screen
  2. If both are active Office TV stays on and office_pc_screen is forced off
5. Office PC screen control
  1. PC screen is controlled by a separate automation
  2. This plan does not power the PC screen back on after Office TV activity ends
6. living room table stops it if presence is only in the living room
7. girlfriend override doesnt effect this if there is more than one person in house while this is on
8. night mode also if paired with gaming mode still runs and stops game mode unless gaming is in bedrooms


## Implementation Notes and Checks
1. Harmony and matrix mapping
  1. Verify activities for Matrix Sony and Matrix Nintendo
2. TV control reliability
  1. Prefer CEC or direct IP services for input select
  2. Retry once if input change fails
3. Sensors quality
  1. Debounce contact sensors
  2. Monitor battery and online state
4. UX considerations
  1. Define per TV default input when no console is active
  2. Define night window where TVs do not auto power on
  3. Optional notifications showing active console and routed room
5. State sync and watchdogs
  1. Periodic check that Harmony activity matches HA state and correct if needed
6. Network and performance
  1. Reserve static IPs for TVs, Harmony Hub, and matrix devices
