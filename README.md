# Dynamic Client Localization System for FiveM
###### A dynamic client localization system for FiveM that allows individual localization for players based on thier language settings

## Introduction
This is a dynamic client localization system for FiveM that allows individual localization for players based on thier language settings.
Designed to be as simple as possible to use and to allow for easy localization of your resources.

The system has support for all the languages that GTA 5 supports, including, English, French, German, Italian, Spanish, Korean, Japanese, Chinese, Russian, Polish, Portuguese, and Brazilian Portuguese.<br>
Unfortunately, ***languages that are not supported by GTA 5 are not supported by this system***.

Due to the nature of localization, the `localize` is only available on the client side. When sending strings between clients or from the server, use the localization key,
rather then the localized string. This means each player can use their preferred language, without running into issues where players are shown strings in a language they don't understand.

Stringtable files are formatted in JSON to allow for easy editing by non-technical users and easy automatic verification of file format.

Because the system is client side, rather then having to use a single language for all players, each individual player can have their own preferred language (translation permitting) localized for them.

## Documentation
The documentation for this resource can be found [**on the system's GitHub repo**](https://github.com/Asaayu/dynamic-client-localization-system-for-fivem/wiki).


## How the system works
- On startup, the system will load all stringtable files from the `stringtables` folder.
- It then creates a table of all the strings in the stringtables, with the key being the string name and the value being the string.
- The `localize` export will then automatically localize the string based on the player's language settings.


## Important Notes
- Only stringtables listed in the `stringtables` metadata field in the `fxmanifest.lua` file will be loaded. These files must also be in the `files` metadata field for the client to download them.
- The JSON file must be valid, if it's not valid the system will throw an error and the resource will not work.
- Localization keys must be unique, add a prefix to the key to identify which resource the key is for.
- If a language is not found in the stringtable, the system will fallback to the English string.
- If the English string is not found in the stringtable, the system will return `UNDEFINED KEY: <key>`.
- Localization keys are not resource specific, if you have a common string you can use the same key in multiple resources.
- The system will use the language from the player's GTA 5 language settings at that point in time, if the player changes their language the returned string will not change until it's localized again or the player reconnects to the server.


## Limitations
- Only languages that are supported by GTA 5 can be used, as it uses the GTA 5 language settings to determine the players language.
- Only client side strings can be localized, when sending text from the server to the client it's recommended to just send the localization key, then localize the string on the client's side before displaying it.
- Asian characters will not display correctly for non-asian game clients.
- Static strings can't be dynamically updated, if the player changes their game language they will need to reconnect to the server for the strings to update to their new language.


## License
Dynamic Client Localization System for FiveM, dynamically localize strings into a player's local supported language.<br>
Copyright © 2022  Asaayu **<https://github.com/Asaayu>**

This program is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 3 of the License, or
(at your option) any later version.

This program is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

You should have received a copy of the GNU General Public License
along with this program.  If not, see **<https://www.gnu.org/licenses/>**.
