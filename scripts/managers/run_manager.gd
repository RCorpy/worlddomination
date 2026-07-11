extends Node

@onready var timer: Timer = $Timer

signal second_passed

func _ready() -> void:
	timer.timeout.connect(_on_timer_timeout)


func _on_timer_timeout() -> void:
	second_passed.emit()
