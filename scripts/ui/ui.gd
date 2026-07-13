extends Control

@onready var goblins_label: Label = $MarginContainer/VBoxContainer/GoblinsLabel
@onready var influence_label: Label = $MarginContainer/VBoxContainer/InfluenceLabel
@onready var send_button: Button = $MarginContainer/VBoxContainer/SendGoblinButton
@onready var upgrades_container = $MarginContainer/VBoxContainer

@export var upgrade_item_scene: PackedScene


signal send_goblin_pressed
signal buy_upgrade_pressed(upgrade: Upgrade)

func _ready() -> void:
	send_button.pressed.connect(_on_send_button_pressed)

func set_goblins(amount: int) -> void:
	goblins_label.text = "Goblins: %d" % amount
	
func set_influence(amount: int) -> void:
	influence_label.text = "Influence: %d" % amount

func _on_send_button_pressed() -> void:
	send_goblin_pressed.emit()
	
func _on_upgrade_pressed(upgrade: Upgrade):
	
	buy_upgrade_pressed.emit(upgrade)
	
func create_upgrades(upgrades: Array[Upgrade]):
	for upgrade in upgrades:
		var item = upgrade_item_scene.instantiate()
		upgrades_container.add_child(item)
		item.setup(upgrade)
		item.buy_pressed.connect(_on_upgrade_pressed)
		
func refresh_upgrade(upgrade: Upgrade, level: int, price: int) -> void:
	var upgrade_item = $MarginContainer/VBoxContainer.get_children()[4]
	upgrade_item.refresh(level, price)
