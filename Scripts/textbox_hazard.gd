extends Area2D

func _ready() -> void:
	var rect = $Panel.get_rect()
	print(rect.size.x)
	$CollisionShape2D.shape.set_size(Vector2(rect.size.x,rect.size.y))
	$CollisionShape2D.set_position(Vector2(rect.size.x/2,rect.size.y/2))


func _on_body_entered(body: Node2D) -> void:
	body.die()
