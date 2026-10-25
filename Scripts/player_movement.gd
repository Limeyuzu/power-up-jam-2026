extends CharacterBody2D

var speed = 400  # speed in pixels/sec
var is_dead = false

var spawn_coordinates = Vector2(0,0)

func _ready() -> void:
	Signals.Level_Complete.connect(_win)
	Signals.Player_Death.connect(_die)
	Signals.Set_Spawn.connect(_set_spawn)

#when the spawn scene is included it sends out a signal on level start, this function sets the spawnpoint to the spawn from the signal
func _set_spawn(pos : Vector2):
	print("spawn point set")
	spawn_coordinates = pos
	global_position = spawn_coordinates

func _physics_process(delta):
	if is_dead == true:
		return
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = direction * speed

	move_and_slide()
	
func _win():
	is_dead = true
	
func _die():
	is_dead = true
	var tween = get_tree().create_tween().set_parallel(true)
	tween.tween_property($Sprite2D, "modulate", Color.RED, 1.0).set_trans(Tween.TRANS_SINE)
	tween.tween_property($Sprite2D, "scale", Vector2(), 1.0).set_trans(Tween.TRANS_BOUNCE)
	tween.chain().tween_callback(_respawn)
	
	
func _respawn():
	global_position = spawn_coordinates
	var tween = get_tree().create_tween().set_parallel(true)
	tween.tween_property($Sprite2D, "modulate", Color.WHITE, 1.0).set_trans(Tween.TRANS_SINE)
	tween.tween_property($Sprite2D, "scale", Vector2(0.664,0.664), 1.0).set_trans(Tween.TRANS_BOUNCE)
	tween.chain().tween_property(self, "is_dead", false, 0)
