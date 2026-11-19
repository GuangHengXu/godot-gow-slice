class_name CombatManager
extends Node

@export var player_fsm: StateMachine
@export var enemy_fsm: StateMachine
@export var player_hurtbox: Hurtbox
@export var enemy_hurtbox: Hurtbox
@export var player_health: Health
@export var enemy_health: Health

var _hitstop_timer: Timer


func _ready() -> void:
	_hitstop_timer = Timer.new()
	_hitstop_timer.one_shot = true
	_hitstop_timer.timeout.connect(_on_hitstop_timeout)
	add_child(_hitstop_timer)
	player_hurtbox.hit_received.connect(_on_player_hit)
	enemy_hurtbox.hit_received.connect(_on_enemy_hit)


func parry_window_open() -> bool:
	var parry_state := player_fsm.states.get("parry") as ParryState
	if parry_state == null:
		return false
	return parry_state.window_active()


func apply_hitstop(duration: float) -> void:
	Engine.time_scale = 0.1
	_hitstop_timer.start(duration)


func _on_hitstop_timeout() -> void:
	Engine.time_scale = 1.0


func _on_player_hit(attack: AttackData) -> void:
	if player_fsm.current_state.name == "Parry" and parry_window_open():
		enemy_fsm.change_state("Stagger")
		apply_hitstop(attack.hitstop_duration)
	else:
		player_health.take_damage(attack.damage)
		player_fsm.change_state("Hurt")


func _on_enemy_hit(attack: AttackData) -> void:
	enemy_health.take_damage(attack.damage)
	if enemy_health.current <= 0.0:
		enemy_fsm.change_state("Dead")
