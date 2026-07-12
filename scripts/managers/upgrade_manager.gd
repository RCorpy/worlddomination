extends Node

@export var available_upgrades: Array[Upgrade]

var purchased_upgrades: Dictionary[Upgrade, int] = {}

func buy_upgrade(upgrade: Upgrade) -> bool:
	if purchased_upgrades.has(upgrade):
		purchased_upgrades[upgrade] += 1
	else:
		purchased_upgrades[upgrade] = 1
	return true

func get_upgrade_level(upgrade: Upgrade) -> int:
	return purchased_upgrades.get(upgrade, 0)

func get_purchased_upgrades() -> Dictionary[Upgrade, int]:
	return purchased_upgrades
