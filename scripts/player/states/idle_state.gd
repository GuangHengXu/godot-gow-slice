class_name IdleState
extends State


func physics_update(_delta: float) -> void:
	var move_input := Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	if move_input != Vector2.ZERO:
		transition_requested.emit("Run")
