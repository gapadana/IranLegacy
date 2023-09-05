# IranLegacy
### FiveM resources used by IranLegacy Server (based on ESX)
## History
Server resources of one of the first FiveM servers in Iran: <b>IranLegacy</b></br>
<b>IranLegacy</b> and <b>IranRolePlay</b> (possibly the first or second FiveM server in Iran) used to be the same server before they split into two separate servers.</br>
As none of the above servers exist now, I am publishing the resources.</br>

## Explain resources
I gather almost all of the resources from the FiveM forum. Many of them are modified, and some resources are created by myself.</br>

## Most notable resources created by myself:
### [VehicleSystem](resources/[Vidat]/VehicleSystem)
This resource disables the availability of NPC vehicles and adds a key system, allowing you to give others access to your car by giving them the key.</br>
The function works by vehicle plates.</br>
You must add the following code to the client where you create the vehicle in order to give the player the key. [example](resources/%5BEsx%5D/esx_taxijob/client/main.lua#L203C4-L203C4)</br>
```TriggerEvent('VS:GiveKey', vehicle)```</br>
Use this command to grant yourself a key to a spawned vehicle. Please note that you must have administrative privileges and be inside the vehicle to execute this command.</br>
```adminkey```
### [CraftSystem](resources/[Vidat]/CraftSystem)
This resource enables players to craft certain items, allowing those with jobs to sell their products to gangs at a higher price. This resource enhances interaction among players.</br>
This resource was a prototype and almost became my last resource for this server, so I never had the chance to improve it. It has some bugs and incomplete features.</br>
To make an item craftable, you must add it to the [configuration file](resources/[Vidat]/CraftSystem/config.lua).</br>

| Config      | Type            | Description                                                             |
| :-----------| :-------------- | :---------------------------------------------------------------------- |
| `name`      | `string`        | name used in database                                                   |
| `crafttime` | `integer`       | time to craft the item is seconds                                       |
| `weapon`    | `boolean`       | is it a weapon                                                          |
| `Needs`     | `array of maps` | list of items needed to craft (name + counts)                           |
| `Jobs`      | `array of maps` | list of jobs that can craft this item with a 2x chance of success       |
| `chance`    | `float`         | the success rate of the craft is determined by a number between 0 and 1 |

The crafting menu opens by pressing the `Z` button.
