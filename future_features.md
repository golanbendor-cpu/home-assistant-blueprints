# FUTURE FEATURES

## Living Room & Coffee Table
1. **Sofa presence starts TV and Yes app.** Coffee table action also starts if TV is not on.  
2. **Movie mode toggle button** in the living room when in sofa.  
3. **Movie mode behavior:**  
   a. Getting up pauses playback  
   b. Returning resumes playback  
   c. Multi-person logic keeps playback if at least one viewer remains seated  

### Available Entities:
| Entity | Device | Area | Integration | Status |
|--------|--------|------|-------------|--------|
| Living Room BRAVIA XR-75X90L | Living Room BRAVIA XR-75X90L | Living Room | DLNA Digital Media Renderer | – |
| SONY XR-75X90L | Living Room BRAVIA XR-75X90L | Living Room | Sony Bravia TV | – |
| Restart | Living Room BRAVIA XR-75X90L | Living Room | Sony Bravia TV | – |
| Terminate apps | Living Room BRAVIA XR-75X90L | Living Room | Sony Bravia TV | – |
| living_room_sony_android_tv | living_room_sony_android_tv | Living Room | Android TV Remote | – |
| Living Room Sony Android TV | living_room_sony_android_tv | Living Room | Android TV Remote | – |
| SONY XR-75X90L | SONY XR-75X90L | Living Room | Google Cast | – |

## House Wide Scene Buttons
1. **Red Lights scene button:**  
   a. Turns red ambilight lighting across the house and closes main lights for Yeelight  
   b. Starts music on all speakers with certain volume  
   c. Suspends lighting automations while active  
   d. Second press stops music and restores Auto everywhere including the tree  

2. **Mood scene button:**  
   a. Stops current lighting automations while active  
   b. Activates night lights across the house including the tree and the bar  
   c. Bedroom uses red Ambilight Yeelight and closes main Yeelight 
   d. While in bed using bedroom presence sensor, Ambilight stays on with red lights and main Yeelight stays off (if bedroom reading lights are on, closes them)
   e. Music plays across the house and in the bedroom  
   f. Companion button returns all rooms to Auto and stops music

## Office Behaviors
1. **Office RGB manual control:**  
   - Office RGB turned on manually in office with Alexa or button
   - Office RGB stays on while present in room then turns off on exit and resets office to Auto 

2. **Desk presence automation:**  
   - Desk presence turns on the computer monitor
   - On exit: turn off office light, monitor, and AC  

3. **Sound routing:**  
   a. Seated in office routes audio to computer speakers   
   b. In bed routes audio to bed setup unless both rooms are occupied, then keep audio on the computer

## LG TV & Media
1. **Sleep brightness TV button** on and off
2. **Open TV when entering bed**
3. **Close TV when exit bed**

## Night Button Automation
1. **Increase media file volume level** a bit

## Sony PS5 Nintendo Switch two
See future_features\PS5_Switch_2_auto.md
with gaming feature for each room


## one blueprint for air condioner automtion

## bathroom motion add a dew point snesor to see water when showring to not turn lights off

## Guest mode

## Buttons around the house to make the light day and auto



---
*For completed features, see `added_features.md`*
*For implementation help, see `helpers.md` for required entities*
*For known issues that might affect implementation, see `bugs.md`*