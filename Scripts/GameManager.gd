extends Node2D


func _ready() -> void:
	Signals.NextLevel.connect(goto_next_level)

func goto_next_level():
	pass
