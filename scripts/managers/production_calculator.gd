extends Node

@onready var upgrade_manager = $"../UpgradeManager"

var goblins_per_click: int = 1
var influence_per_goblin: float = 1
var goblins_per_second: int = 0

func recalculate() -> void:
	recalculate_influence_per_goblin()
	recalculate_goblins_per_click()
	recalculate_goblins_per_second()

func get_influence_per_second(goblins: int) -> int:
	return  round(goblins * influence_per_goblin)

func recalculate_influence_per_goblin() -> void:
	influence_per_goblin = 1
	var upgrades = upgrade_manager.get_purchased_upgrades()

	for upgrade in upgrades:
		var amount: int = upgrade_manager.get_upgrade_level(upgrade)
		for modifier: Modifier in upgrade.modifiers:
			if modifier.effect != Modifier.Effect.INFLUENCE_PER_GOBLIN:
				continue

			match modifier.operation:
				Modifier.Operation.ADD:
					influence_per_goblin += modifier.value * amount

				Modifier.Operation.SUBTRACT:
					influence_per_goblin -= modifier.value * amount

				Modifier.Operation.MULTIPLY:
					influence_per_goblin *= pow(modifier.value, amount)
	
func recalculate_goblins_per_click():
	return
	
func recalculate_goblins_per_second():
	return
