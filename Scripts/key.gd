extends Area2D

var original_position: Vector2 = Vector2(0,0)
@onready var geralt_ping: AudioStreamPlayer = $GeraltPing

func _ready() -> void:
	Signals.Player_Death.connect(_reset_self)
	original_position = position
	
	var tween = get_tree().create_tween().set_loops(99)
	tween.tween_property($Sprite2D, "rotation_degrees", 8, 1.0).set_trans(Tween.TRANS_SINE)
	tween.tween_property($Sprite2D, "rotation_degrees", -8, 1.0).set_trans(Tween.TRANS_SINE)


func _on_body_entered(body: Node2D) -> void:
	if body.is_in_group("player"):
		Signals.emit_signal("Key_Aquired", self)
		position = Vector2(0,3000)
		$Sprite2D.visible = false
		$GeraltPing.play()

func _reset_self():
	position = original_position
	$Sprite2D.visible = true
