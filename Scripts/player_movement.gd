extends CharacterBody2D

var speed = 400  # speed in pixels/sec
var is_dead = false
func _physics_process(delta):
	if is_dead == true:
		return
	var direction = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	velocity = direction * speed

	move_and_slide()
	
func win():
	is_dead = true
	
func die():
	is_dead = true
	var tween = get_tree().create_tween().set_parallel(true)
	tween.tween_property($Sprite2D, "modulate", Color.RED, 1.0).set_trans(Tween.TRANS_SINE)
	tween.tween_property($Sprite2D, "scale", Vector2(), 1.0).set_trans(Tween.TRANS_BOUNCE)
	tween.chain().tween_callback(respawn)
	
	
func respawn():
	global_position = $"../Spawn".global_position
	var tween = get_tree().create_tween().set_parallel(true)
	tween.tween_property($Sprite2D, "modulate", Color.WHITE, 1.0).set_trans(Tween.TRANS_SINE)
	tween.tween_property($Sprite2D, "scale", Vector2(0.664,0.664), 1.0).set_trans(Tween.TRANS_BOUNCE)
	tween.chain().tween_property(self, "is_dead", false, 0)
