extends Area2D

@export var panel: PanelContainer
@export var textLabel: RichTextLabel
var margins = 10;

func _ready() -> void:
	await textLabel.finished
	await get_tree().process_frame
	var rect = panel.get_rect()
	print(rect.size.x, " ", rect.size.y)
	$CollisionShape2D.shape.set_size(Vector2(rect.size.x - 2 * margins, rect.size.y - 2 * margins))
	$CollisionShape2D.set_position(Vector2(rect.size.x / 2, rect.size.y / 2))


func _on_body_entered(body: Node2D) -> void:
	body.die()
