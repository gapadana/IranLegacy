## What is it?
A simple engine start-stop system. If your car (only enabled for cars) is stopped for 4 seconds, the engine will automatically disable itself. As soon as you hit the brakes/reverse or hit the accelerator controls the engine will be turned on and you can drive away with minimal delay.

## Video preview
https://streamable.com/cs65n

(or the direct link in case of embed fuckups: https://streamable.com/cs65n)

## Config options:
These config options can be changed in the `startstopclient.lua` file at the very top.

|option|default value|description|
|:--|:--|:--|
|`delay`|`4000`|Configure the amount of time it takes for your engine to be killed when your vehicle is stopped. Default 4 seconds.|
|`toggleCommand`|`"ss"`|The command to enable/disable the start-stop system in case you don't want it enabled. When toggling the start stop system using this command, the user preference is saved to the client, so next time the user joins, their last saved setting will be used so they don't have to constantly toggle it on/off once they (re)join.|
|`sendChatMessage`|`true`|When true it'll send a chat message indicating the new state when the toggle command is used.|
|`sendNotification`|`true`|Sends a notification above the minimap whenever the toggle command is used. It's recommended to either enable this or the chat message, don't enable both, that's just silly.|


## Copyright
This is made by Vespura (www.vespura.com), so copyright (©) Vespura 2019.


## License
Feel free to edit this resource to your liking, there isn't much to change however, as it's just a super basic script.
Don't be a dick, do not re-release this, and don't claim this to be yours because it will be taken down.

If you have a great improvement to share, let me know and maybe I can merge your changes into this script. If not, I may allow you to re-release your edited version, just please _ask_ for permission instead of just _taking_ what isn't yours.


## Changelog:

### v1.0.2
- Vehicle lights can now be toggled while the vehicle is off using the normal lights switch control.
- When you hold either the reverse/brake control or the accelerate control down while the vehicle is stationary, the engine won't be shut off at all, instead of shutting off every 4 seconds and then instantly turning back on.

### v1.0.1
- Vehicle lights should now remain on if the vehicle engine automatically turned off at night.

### v1.0.0
- Initial release

