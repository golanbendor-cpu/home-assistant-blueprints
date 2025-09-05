# BUGS

## Overview
This document tracks current bugs and regressions in the home automations. Each item includes symptoms, likely cause, quick checks, and acceptance criteria.

## Priority P1
1. Bedroom bed light off delay when entering bed is too long  

2. Small flicker at room entrances  
automations connected - room_presence_plus.yaml

3. Night dimming does not transition at all and work in relevant rooms 
automations connected - room_presence_plus.yaml

4. Keep on zones flicker then turn off for a millisecond and back on  
   Symptoms  
automations connected - room_presence_plus.yaml


6. Bathroom with two motion sensors flickers then turns off after a couple of minutes  
 automations connected - room_presence_plus.yaml

7. ✅ FIXED - Night dimming transitions missing - brightness changes instantly instead of smoothly
   Location: room_presence_plus.yaml:532 - missing transition parameter
   automations connected - room_presence_plus.yaml
   FIXED: Added transition parameter for smooth dimming

8. ✅ FIXED - Manual light control (Alexa/app) doesn't properly override automation 
   Issue: Only detects manual turn-on, not turn-off or state changes
   Location: room_presence_plus.yaml:432-435 external_main_on trigger
   automations connected - room_presence_plus.yaml
   FIXED: Added external_main_off trigger and handler to respect manual control

9. ✅ FIXED - Manual Night mode missing transition parameter
   Location: room_presence_plus.yaml:558 - brightness_pct without transition
   automations connected - room_presence_plus.yaml
   FIXED: Added transition parameter for smooth manual night mode changes
   
10. Fourth Room ambilight entity typo 
    Location: automation.yaml:56 - "ambiight" should be "ambilight"
    automation: Fourth Room Presence Plus

11. ✅ RESOLVED - Bedroom automation uses undefined template sensor
    Location: automation.yaml:629 - binary_sensor.bedroom_space_light_ok not defined in helpers.md
    automation: Bedroom Presence Plus
    EXPLANATION: This should be a template sensor checking bedroom space presence + TV state + night mode
    TEMPLATE PROVIDED: User provided template, added to helpers.md

12. ✅ FIXED - Bedroom LED blueprint color mode transitions missing
    Location: bedroom_led_blueprint.yaml:257-331 - color changes have no transitions
    automations connected - bedroom_led_blueprint.yaml
    FIXED: Added transition parameters to all 7 color modes for smooth color changes

13. Hallway automation helpers disabled
    ISSUE: Either automations_master_enable OR hallway_sensors_enable is OFF
    FIX: Check both helpers are enabled in Home Assistant

14. ✅ FIXED - Manual override lacks timeout/state tracking 
    ISSUE: When lights are turned on manually (Alexa), no automatic return to Auto after timeout
    LOCATION: room_presence_plus.yaml - external_main_on/off handlers lack state management
    PROBLEM: No mechanism to automatically return to automation control after manual intervention
    FIXED: Added comprehensive manual override system with timer helpers and motion override

15. ✅ INTENDED DESIGN - Bedroom automation layering
    DESIGN: Bed presence controls mode → Presence Plus follows mode (sleep priority)
    LOCATIONS: 
    - Bedroom Bed Presence automation (sets bedroom_mode Off/Auto based on bed occupancy)
    - Bedroom Presence Plus automation (respects bedroom_mode for lighting control)
    BEHAVIOR: Enter bed = lights off, leave bed = lights resume automation

16. ✅ INTENDED DESIGN - Living room table eating priority  
    DESIGN: Table contact overrides lighting for eating needs
    LOCATIONS:
    - Living Room Presence Plus automation (uses living_room_mode for lighting)
    - Living Room Table Contact automation (forces Day mode when eating)
    BEHAVIOR: Open table = bright lights for eating, close table = restore previous mode

17. ✅ INTENDED DESIGN - Bedroom LED ambiance system
    DESIGN: LEDs provide ambiance only when conditions are right
    LOCATIONS:
    - Bedroom LED strips activate when TV off + no ceiling lights + night mode
    - Bedroom Presence Plus controls main ceiling lighting independently
    BEHAVIOR: LED ambiance without conflicting with main room lighting

18. ✅ INTENDED DESIGN - Global state hierarchy system
    DESIGN: Global night mode wins over all, global day override wins over night mode in selected rooms
    USAGE: 28 uses of global_day_override and 25 uses of night_mode across automations
    BEHAVIOR: House-wide sleep priority with partner day flexibility in specific rooms

19. ✅ FIXED - Critical extra_on_targets logic error
    ISSUE: Blueprint turned OFF extra_on_targets instead of turning them ON
    LOCATION: room_presence_plus.yaml lines 603 & 632
    PROBLEM: When lights turned off, extra targets (like fans) turned OFF instead of ON
    FIXED: Changed service calls from turn_off to turn_on for extra_on_targets

20. ✅ FIXED - Bedroom bed automation slow light turn-off
    ISSUE: Lights turn off slowly when entering bed
    LOCATION: Bedroom bed automation relied only on mode change
    PROBLEM: Automation set bedroom_mode to Off but didn't directly control lights
    FIXED: Added immediate light turn-off before mode change in bedroom_bed_presence_control.yaml

21. ✅ IMPROVED - Bedroom TV script reliability issues  
    ISSUE: TV doesn't turn on reliably from automation
    LOCATION: script.turn_on_bedroom_tv_cec_wol timing and retry logic
    PROBLEM: Single WOL attempt, short delays, inadequate timeout
    IMPROVED: Created turn_on_bedroom_tv_improved.yaml with multiple WOL attempts and better timing

22. Dimming end state not maintaining moonlight mode
   ISSUE: After night dimming window ends, lights revert to wrong brightness instead of staying at 3% moonlight
   LOCATION: room_presence_plus.yaml - dimming logic end state handler
   SYMPTOMS: Dimming works perfectly during transition, but final state doesn't maintain moonlight mode
   automations connected - room_presence_plus.yaml

23. Manual Alexa override lights not turning off after timer
   ISSUE: When lights turned on manually via Alexa, they don't automatically turn off after manual override timer expires
   LOCATION: Manual override timer system in room_presence_plus.yaml
   SYMPTOMS: Manual lights stay on indefinitely instead of returning to automation control
   automations connected - room_presence_plus.yaml

24. Alexa manual control triggering ambilight incorrectly
   ISSUE: When telling Alexa to turn on lights, ambilight sometimes turns on when room should be in auto mode
   LOCATION: Manual override detection and ambilight control logic
   SYMPTOMS: Ambilight activation during manual control when it shouldn't be triggered
   automations connected - room_presence_plus.yaml

25. ✅ FIXED - Office work automation stuck session bug
   ISSUE: Work session stays active after external PC shutdown (Alexa/manual), preventing restart
   LOCATION: Office Work Automation blueprint
   PROBLEM: Work mode toggle remains ON when PC screen turned OFF externally
   FIXED: Added PC screen OFF trigger with auto-reset work session + enhanced restart logic
   GITHUB: https://github.com/golanbendor-cpu/home-assistant-blueprints

26. ✅ FIXED - Office work automation optimization regression
   ISSUE: Added "do nothing" case for work mode ON + PC screen ON breaks PC screen activation
   LOCATION: Office Work Automation blueprint Case 3 logic
   PROBLEM: When optimization logic added, PC screen stops turning on properly
   SYMPTOMS: Chair vibration detected but PC screen doesn't activate
   FIXED: Added proper condition to prevent trigger when work mode ON + PC screen ON
   SOLUTION: `{{ not (is_state(work_toggle, 'on') and is_state(pc_switch, 'on')) }}` condition filters at trigger level

