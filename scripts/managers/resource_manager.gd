extends Node

signal goblins_changed(new_amount: int)

var _goblins: int = 0


func get_goblins() -> int:
	return _goblins


func add_goblins(amount: int) -> void:
	_goblins += amount
	goblins_changed.emit(_goblins)
