# IranLegacy
### FiveM resources used by IranLegacy Server (based on ESX)
## History
Server resources of one of the first FiveM servers in Iran: <b>IranLegacy</b></br>
<b>IranLegacy</b> and <b>IranRolePlay</b> (possibly the first or second FiveM server in Iran) used to be the same server before they split into two separate servers.</br>
As none of the above servers exist now, I am publishing the resources.

## Created Resources:
### [VehicleSystem](resources/[Vidat]/VehicleSystem)
This resource disables the availability of NPC vehicles and adds a key system, allowing you to give others access to your car by giving them the key.</br>
The function works by vehicle plates.</br>
You must add the following code to the client where you create the vehicle in order to give the player the key. [example](resources/%5BEsx%5D/esx_taxijob/client/main.lua#L203C4-L203C4)
```TriggerEvent('VS:GiveKey', vehicle)```


