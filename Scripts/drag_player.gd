extends Node2D

const SPEED : int = 50

var dragging = false
var offset = Vector2(0,0)

func _process(_delta):
	if dragging:
		position = get_global_mouse_position() - offset

func _on_click_box_button_down() -> void:
	print("button click")
	dragging = true
	offset = get_global_mouse_position() - global_position


func _on_click_box_button_up() -> void:
	print("button leave")
	dragging = false
