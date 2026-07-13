class_name Upgrade
extends Resource

@export var id: String
@export var title: String
@export_multiline var description: String

@export var base_price: int = 0

@export var modifiers: Array[Modifier]
