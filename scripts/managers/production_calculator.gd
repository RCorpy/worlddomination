extends Node

var goblins_per_click: int = 1
var influence_per_goblin: int = 1
var influence_per_second: int = 0
var goblins_per_second: int = 0

func recalculate_influence_per_second(goblins: int) -> void:
	influence_per_second =  goblins * influence_per_goblin
