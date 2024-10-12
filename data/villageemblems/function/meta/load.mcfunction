
# Migrate all data upwards
function villageemblems:meta/migrate

execute if data storage villageemblems:data {clear_gen_required:1} run function villageemblems:village/clear_gen_required
