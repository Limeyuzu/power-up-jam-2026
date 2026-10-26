extends CharacterBody2D

@export var is_mouse_move = false

var speed = 400  # speed in pixels/sec
var drag_speed = 800
var is_dead = false
var spawn_coordinates = Vector2(0,0)

var dragging = false
var offset = Vector2(0,0)
var originalScale: Vector2

func _ready() -> void:
	Signals.Level_Complete.connect(_win)
	Signals.Player_Death.connect(_die)
	Signals.Set_Spawn.connect(_set_spawn)
	originalScale = $Sprite2D.scale
	
	if is_mouse_move == true:
		$HintLabel.text = str("click to move")
	else: 
		$HintLabel.text = str("wasd to move")

#when the spawn scene is included it sends out a signal on level start, this function sets the spawnpoint to the spawn from the signal
func _set_spawn(pos : Vector2):
	print("spawn point set")
	spawn_coordinates = pos
	global_position = spawn_coordinates

func _physics_process(_delta):
	var direction 
	move_and_slide()
	#stop movement when the player is dead
	if is_dead == true:
		return
	
	#if mouse movement is set to true, move the character with the mouse by clicking and dragging them
	if dragging && is_mouse_move:
		var target = get_global_mouse_position() - offset
		direction = target - position
		if position.distance_to(target) > 6:
			velocity = direction.normalized() * drag_speed
		else: 
			velocity = Vector2(0,0)
	else:
		velocity = Vector2(0,0)
		
	#if mouse movement is set to false, the keyboard input code is used below
	if is_mouse_move == true:
		return
	direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = direction * speed

	
	
func _win():
	is_dead = true
	
func _die():
	is_dead = true
	dragging = false
	velocity = Vector2(0,0)
	$DieSfx.play()
	var tween = get_tree().create_tween().set_parallel(true)
	tween.tween_property($Sprite2D, "modulate", Color.RED, 1.0).set_trans(Tween.TRANS_SINE)
	tween.tween_property($Sprite2D, "scale", Vector2(), 1.0).set_trans(Tween.TRANS_BOUNCE)
	tween.chain().tween_callback(_respawn)
	
	
func _respawn():
	global_position = spawn_coordinates
	var tween = get_tree().create_tween().set_parallel(true)
	tween.tween_property($Sprite2D, "modulate", Color.WHITE, 1.0).set_trans(Tween.TRANS_SINE)
	tween.tween_property($Sprite2D, "scale", originalScale, 1.0).set_trans(Tween.TRANS_BOUNCE)
	tween.chain().tween_property(self, "is_dead", false, 0)


func _on_button_button_down() -> void:
	print("button click")
	dragging = true
	offset = get_global_mouse_position() - global_position


func _on_button_button_up() -> void:
	print("button leave")
	dragging = false
