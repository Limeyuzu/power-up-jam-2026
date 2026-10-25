extends Area2D


func _ready() -> void:
	#bad practice to have a timer script delay buuut I need this done quicksmart and otherwise this is firing at the same time as the player objects _ready()
	await get_tree().create_timer(0.01).timeout
	Signals.emit_signal("Set_Spawn", global_position)
