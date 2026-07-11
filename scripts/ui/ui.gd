extends Control

@onready var goblins_label: Label = $MarginContainer/VBoxContainer/GoblinsLabel
@onready var influence_label: Label = $MarginContainer/VBoxContainer/InfluenceLabel
@onready var send_button: Button = $MarginContainer/VBoxContainer/SendGoblinButton

signal send_goblin_pressed

func _ready() -> void:
	send_button.pressed.connect(_on_send_button_pressed)

func set_goblins(amount: int) -> void:
	goblins_label.text = "Goblins: %d" % amount
	
func set_influence(amount: int) -> void:
	influence_label.text = "Influence: %d" % amount

func _on_send_button_pressed() -> void:
	send_goblin_pressed.emit()
