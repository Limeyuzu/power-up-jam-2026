extends Area2D

func _ready() -> void:
	Signals.Player_Death.connect(_reset_self)

func _on_body_entered(_body: Node2D) -> void:
	print("body entered")
	Signals.emit_signal("Key_Aquired", self)
	$CollisionShape2D.disabled = true
	$Sprite2D.visible = false

func _reset_self():
	$CollisionShape2D.disabled = false
	$Sprite2D.visible = true
