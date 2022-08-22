# Dynamic Client Localization System for FiveM
A dynamic client localization system for FiveM that allows individual localization for players based on thier language settings

## How to install the resource
1. &nbsp;Download the latest release from the [**releases page**](https://github.com/Asaayu/Dynamic-FiveM-Client-Localization-System/releases/latest)

3. &nbsp;Add the `[language]` folder to your resources folder
   - The folder contains both the main system `language` and an example resource `language_example`. Remove the example resource if you don't need it.

4. &nbsp;Add `ensure [language]` to your server.cfg

## How to use the resource
1. &nbsp;**(Optional)** - Add the following to the `fxmanifest.lua` file of any resources that uses the localization system, this ensures that the language system is loaded and running before the resource tries to use it.
   ```lua
   dependency 'language'
   ```

2. &nbsp;Create a stringtable JSON file for the resource.<br>
   [**Follow the steps in the 'How to add new strings' section**](#how-to-add-new-strings)

3. &nbsp;To get the a localized string from a key, use the following export:
   ```lua
   local localizedString = exports.language:localize('STR_HELLO')
   ```
    - The `localize` export takes a single argument, the key of the string you want to localize.
    - The `localize` export returns a string, the localized string for the players current language, the English string if the specific language is not found, or an `UNDEFINED KEY: <key>` string if no localized strings are found.
    - When using the localized string in a dynamic environment, such as a UI, it would be best to use the `localize` export every time the string is shown, that way if the player changes their language, the string will update to match the new language.
    Although there will be situations where the string can't be dynamically changed, in these cases localize the string with the players language when it's run, and if they change their game language, they'll need to reconnect to the server for it to update to their new language.

## How to add new strings
1. &nbsp;Create a new JSON file in the `stringtable` folder of the `language` resource.
   - The name of the file should be the same as the name of the resource or something that easily identifiers which resource the file is for.
   - The name must start with `stringtable_`
   - The file extension must be `.json`

2. &nbsp;Copy and paste the following into the file and save it.
   ```json
   {
        "STR_EXAMPLE":
        {
            "en": "Example"
        }
   }
   ```

3. &nbsp;Use the example string as a template for adding new strings.
   - The key of the string is the name of the string, this is what you will use to get the string from the localization system.
     - It's recommended to start all string keys with `STR_` to easily identify them.
     - The key must be unique, the system will throw an error if the key already exists.
     - The key will made uppercase, so `STR_EXAMPLE` and `str_example` are the same key.
   - The return of the string is a table of languages and their translations.
     - By default, the system will attempt to get the language from the player's GTA 5 language settings. If the language specific string is not found in the stringtable the system will fallback to the English string, if the English string is not found the system will return<br>`UNDEFINED KEY: <key>`.
     - Add languages to the table by adding a new key with the language code as the key and the translation as the value.
       - Languages codes:
         - `en` - English
         - `br` - Brazilian
         - `cn` - Chinese (Simplified)
         - `de` - German
         - `es` - Spanish
         - `fr` - French
         - `it` - Italian
         - `jp` - Japanese
         - `kr` - Korean
         - `mx` - Mexican
         - `pl` - Polish
         - `ru` - Russian
         - `tw` - Chinese (Traditional)
       - The language code will made uppercase, so `EN` and `en` will both work.
       - The translation can be any string, but many asian characters will not display correctly for non-asian game clients.
     - The localized strings supprot formatting, see the [**Formatting**](#formatting) section for more information.

4. &nbsp;Continue adding strings to the file until you have all the strings you need.
    - Make sure the file is valid JSON, you can use an [**online JSON validator**](https://jsonlint.com/) to check if the file is valid.
    ```json
   {
        "STR_EXAMPLE":
        {
            "en": "Example"
        },
        "STR_HELLO":
        {
            "en": "Hello",
            "br": "Olá",
            "cn": "你好",
            "de": "Hallo",
            "es": "Hola",
            "fr": "Bonjour",
            "it": "Ciao",
            "jp": "こんにちは",
            "kr": "안녕하세요",
            "mx": "Hola",
            "pl": "Cześć",
            "ru": "Привет",
            "tw": "你好"
        }
   }
   ```

## Formatting
The localized strings support formatting, this allows you to add dynamic information to the string.
For information on how to format strings, see [**this page**](https://pgl.yoyo.org/luai/i/string.format).

Example:
```lua
local localizedString = exports.language:localize('STR_HELLO', 'Asaayu', 'Alex', 25)
```
Stringtable File:
```json
{
    "STR_HELLO":
    {
        "en": "Hello %s, have you seen %s they've turned %d years old today!"
    }
}
```
The localized string will be `Hello Asaayu, have you seen Alex they've turned 25 years old today!`

If you don't provide any arguments to the `localize` export, the string won't be formatted, make sure you provide the correct number of arguments for the string or else it will throw an error.



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
Dynamic Client Localization System for FiveM, dynamiclly localize strings into a player's local supported language.<br>
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
