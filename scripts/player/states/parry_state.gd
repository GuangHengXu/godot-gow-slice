class_name ParryState
extends State

const WINDOW_DURATION: float = 0.15

var _window_timer: Timer


func _ready() -> void:
	_window_timer = Timer.new()
	_window_timer.one_shot = true
	_window_timer.wait_time = WINDOW_DURATION
	add_child(_window_timer)


func enter() -> void:
	_window_timer.start()


func window_active() -> bool:
	return _window_timer.time_left > 0.0


func physics_update(_delta: float) -> void:
	if not window_active():
		transition_requested.emit("Idle")
