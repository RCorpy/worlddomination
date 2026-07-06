extends Node

@onready var ui: Control = $UI
@onready var resource_manager = $Managers/ResourceManager


func _ready() -> void:
	ui.send_goblin_pressed.connect(_on_send_goblin_pressed)
	
	#Actualizar UI cada vez que cambian los goblins
	resource_manager.goblins_changed.connect(ui.set_goblins)
	
	#actualizar UI para empezar
	ui.set_goblins(resource_manager.get_goblins())


func _on_send_goblin_pressed() -> void:
	resource_manager.add_goblins(1)
