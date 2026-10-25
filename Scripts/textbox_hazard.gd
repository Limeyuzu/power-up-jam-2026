extends Area2D

@export var panel: Control
@export var textLabel: RichTextLabel
@export var collisionShape: CollisionShape2D

var margins = 10;

func _ready() -> void:
	await textLabel.finished
	await get_tree().process_frame
	var rect = panel.get_rect()
	collisionShape.shape.set_size(Vector2(rect.size.x - 2 * margins, rect.size.y - 2 * margins))
	collisionShape.set_position(Vector2(rect.size.x / 2, rect.size.y / 2))

func _on_body_entered(body: Node2D) -> void:
	Signals.emit_signal("Player_Death")
