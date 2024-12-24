## Summary
These two scripts produce CSV files for the Epic Minigames [PlayerSurvey](https://github.com/MilkFrame/EpicArchive/tree/main/Archive/Epic%20Minigames/PlayerSurvey) archive, which is an archive of player data such as levels, wins, and equipped items. The two scripts themselves will not produce anything, but require the setup outlined below and the database itself (_which is closed source_) to format the data from.

## Setup
1. Insert Script `epic-minigames-csv-archiver.lua` in ServerScriptService
2. Insert Script `epic-minigames-database-init.lua` in ServerScriptService
3. Insert ModuleScripts `Batch1`, `Batch2`, `Batch3`, etc, in ServerStorage. Paste the raw database in these ModuleScripts.
4. Insert BoolValue `Initialised` in ServerScriptService, with value = false
5. Insert BindableFunctions `getDatabase` and `getDatabaseArray` in ServerScriptService

## Manual
1. When the project is run, the batches will be unioned into one complete database by the init script.
2. Once the complete database is initialized, the archiver script will print 20 delimited CSV files into the output, each capped at 384,000 characters each.
3. Copy all the output and paste it into a square-braced string variable in a dummy script, i.e. `[===[output here]===]`
4. Copy each of the CSV files one by one to update all the survey files.
