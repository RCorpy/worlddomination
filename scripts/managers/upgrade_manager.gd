extends Node

const PRICE_MULTIPLIER: float = 1.2

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

func get_total_upgrade_levels() -> int:
	var total := 0
	for upgrade in purchased_upgrades:
		total += purchased_upgrades[upgrade]

	return total
	
func get_upgrade_price(upgrade: Upgrade) -> int:
	return round(
		upgrade.base_price *
		pow(PRICE_MULTIPLIER, get_total_upgrade_levels())
	)
