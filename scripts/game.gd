extends Node

@onready var ui: Control = $UI
@onready var resource_manager = $Managers/ResourceManager
@onready var production_calculator = $Managers/ProductionCalculator
@onready var run_manager = $Managers/RunManager


func _ready() -> void:
	ui.send_goblin_pressed.connect(_on_send_goblin_pressed)
	run_manager.second_passed.connect(_on_second_passed)
	
	#Actualizar UI cada vez que cambian los goblins
	resource_manager.goblins_changed.connect(ui.set_goblins)
	
	#actualizar UI para empezar
	ui.set_goblins(resource_manager.get_goblins())


func _on_second_passed() -> void:
	resource_manager.add_influence(
		production_calculator.influence_per_second
	)
	ui.set_influence(resource_manager._influence)

func _on_send_goblin_pressed() -> void:
	resource_manager.add_goblins(production_calculator.goblins_per_click)
	update_production()

func update_production()->void:
	production_calculator.recalculate_influence_per_second(resource_manager.get_goblins())
