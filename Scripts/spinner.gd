extends Node2D

@export var rotation_speed = 34

@export var assigned_NPCS: Array[Node2D] = []

func _process(delta: float) -> void:
	rotation_degrees += (rotation_speed * delta);
	for i in assigned_NPCS:
		i.rotation_degrees -= rotation_speed * delta
