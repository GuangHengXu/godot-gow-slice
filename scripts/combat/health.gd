class_name Health
extends Node

signal died
signal health_changed(current: float, maximum: float)

@export var max_health: float = 100.0

var current: float


func _ready() -> void:
	current = max_health


func take_damage(amount: float) -> void:
	current = maxf(0.0, current - amount)
	health_changed.emit(current, max_health)
	if current <= 0.0:
		died.emit()
