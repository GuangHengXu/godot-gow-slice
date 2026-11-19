class_name Hurtbox
extends Area2D

signal hit_received(attack: AttackData)


func _ready() -> void:
	area_entered.connect(_on_area_entered)


func _on_area_entered(area: Area2D) -> void:
	if area is Hitbox and area.attack_data != null:
		hit_received.emit(area.attack_data)
