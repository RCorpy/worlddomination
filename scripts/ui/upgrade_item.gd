class_name UpgradeItem

extends VBoxContainer

@onready var title_label: Label = $UpgradeTitle
@onready var price_label: Label = $UpgradePrice
@onready var buy_button: Button = $UpgradeButton

signal buy_pressed(upgrade: Upgrade)

var upgrade: Upgrade


func setup(new_upgrade: Upgrade) -> void:
	upgrade = new_upgrade
	title_label.text = new_upgrade.title
	price_label.text = "Cost: %d" % new_upgrade.price


func _ready() -> void:
	buy_button.pressed.connect(_on_buy_pressed)


func _on_buy_pressed() -> void:
	buy_pressed.emit(upgrade)
