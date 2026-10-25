extends StaticBody2D

var door_health = 1
@export var assigned_keys: Array[Area2D] = []

func _ready() -> void:
	Signals.Key_Aquired.connect(key_aquired)
	#if no keys have been assigned, then remove self
	if assigned_keys.size() <= 0:
		queue_free()
	else:
		door_health = assigned_keys.size()
		$KeysRemainingLabel.text = str(door_health)

func key_aquired(key_chosen : Area2D):
	for i in assigned_keys:
		if i == key_chosen:
			door_health -= 1
			$KeysRemainingLabel.text = str(door_health)
	if door_health <= 0:
		#can do a more complicated door removal animation 
		queue_free()
