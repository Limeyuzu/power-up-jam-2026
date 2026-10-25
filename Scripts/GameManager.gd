extends Node2D

@export var target_level : PackedScene

func _ready() -> void:
	Signals.Next_Level.connect(goto_next_level)

func goto_next_level():
	call_deferred("next_level")

func next_level():
	get_tree().change_scene_to_packed(target_level)
