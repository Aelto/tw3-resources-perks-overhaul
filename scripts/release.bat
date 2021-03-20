
rmdir "%modpath%\release" /s /q
mkdir "%modpath%\release"

mkdir "%modpath%\release\mods\%modname%\content\scripts\"
rmdir "%modPath%\release\mods\%modName%\content\" /s /q
XCOPY "%modPath%\src" "%modPath%\release\mods\%modName%\content\scripts\" /e /s /y
XCOPY "%modPath%\strings" "%modPath%\release\mods\%modName%\content\" /e /s /y

mkdir "%modpath%\release\mods\%modname%PerksStrings\content\"
XCOPY "%modPath%\strings-perks" "%modPath%\release\mods\%modName%PerksStrings\content\" /e /s /y

mkdir "%modpath%\release\bin\config\r4game\user_config_matrix\pc\"
copy "%modPath%\mod-menu.xml" "%modPath%\release\bin\config\r4game\user_config_matrix\pc\%modname%.xml" /y
