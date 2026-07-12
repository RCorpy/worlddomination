extends Node

@onready var ui: Control = $UI
@onready var resource_manager = $Managers/ResourceManager
@onready var production_calculator = $Managers/ProductionCalculator
@onready var run_manager = $Managers/RunManager
@onready var upgrade_manager = $Managers/UpgradeManager

func _ready() -> void:
	ui.send_goblin_pressed.connect(_on_send_goblin_pressed)
	ui.buy_upgrade_pressed.connect(_on_buy_upgrade_pressed)
	run_manager.second_passed.connect(_on_second_passed)
	resource_manager.influence_changed.connect(ui.set_influence)
	
	#Actualizar UI cada vez que cambian los goblins
	resource_manager.goblins_changed.connect(ui.set_goblins)
	
	#actualizar UI para empezar
	ui.set_goblins(resource_manager.get_goblins())
	ui.set_influence(resource_manager.get_influence())
	
	#setup del upgrade que habra que cambiar
	ui.create_upgrades(upgrade_manager.available_upgrades)


func _on_second_passed() -> void:
	resource_manager.add_influence(
		production_calculator.get_influence_per_second(resource_manager.get_goblins())
	)


func _on_send_goblin_pressed() -> void:
	resource_manager.add_goblins(production_calculator.goblins_per_click)

func _on_buy_upgrade_pressed(upgrade: Upgrade):
	
	if !resource_manager.spend_influence(upgrade.price):
		return

	upgrade_manager.buy_upgrade(upgrade)

	production_calculator.recalculate()
