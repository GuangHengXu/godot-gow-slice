class_name State
extends Node

signal transition_requested(new_state_name: String)

var actor: CharacterBody2D


func enter() -> void:
	pass


func exit() -> void:
	pass


func physics_update(_delta: float) -> void:
	pass


func handle_input(_event: InputEvent) -> void:
	pass
