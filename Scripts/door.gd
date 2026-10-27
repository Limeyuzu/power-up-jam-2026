extends StaticBody2D

var door_health = 1
@export var assigned_keys: Array[Area2D] = []
var door_unlock = false

func _ready() -> void:
	Signals.Key_Aquired.connect(key_aquired)
	Signals.Player_Death.connect(_player_death)
	#if no keys have been assigned, then open door automatically
	if assigned_keys.size() <= 0:
		_change_door_state(true)
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
		_change_door_state(true)

func _on_area_2d_body_entered(body: Node2D) -> void:
	if door_unlock == true:
		Signals.emit_signal("Level_Complete")
		
func _player_death():
	if assigned_keys.size() <= 0:
		_change_door_state(true)
	else:
		door_health = assigned_keys.size()
		$KeysRemainingLabel.text = str(door_health)
		_change_door_state(false)
	
		
func _change_door_state(open : bool):
	if open == true:
		door_unlock = true
		$DoorOpen_Sprite.visible = true
		$DoorClosed_Spite.visible = false
		$KeysRemainingLabel.visible = false
	if open == false:
		door_unlock = false
		$DoorOpen_Sprite.visible = false
		$DoorClosed_Spite.visible = true
		$KeysRemainingLabel.visible = true
