extends Node

signal goblins_changed(new_amount: int)
signal influence_changed(new_amount: int)

var _goblins: int = 0
var _influence: int = 0


func get_goblins() -> int:
	return _goblins


func add_goblins(amount: int) -> void:
	_goblins += amount
	goblins_changed.emit(_goblins)


func get_influence() -> int:
	return _influence	


func add_influence(extra_influence) -> void:
	_influence += extra_influence
	influence_changed.emit(_influence)


func spend_influence(amount: int) -> bool:
	if _influence < amount:
		return false

	_influence -= amount
	influence_changed.emit(_influence)
	return true
