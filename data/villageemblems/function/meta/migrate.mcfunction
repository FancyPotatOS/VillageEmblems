
# Ensure the master scoreboard exists
scoreboard objectives add villageemblems.master dummy

# Apply migration if required
execute unless score version villageemblems.master matches 2.. run function villageemblems:meta/migrations/latest_version
