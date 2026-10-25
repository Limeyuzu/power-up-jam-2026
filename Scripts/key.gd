extends Area2D



func _on_body_entered(_body: Node2D) -> void:
	Signals.emit_signal("Key_Aquired", self)
	queue_free()
