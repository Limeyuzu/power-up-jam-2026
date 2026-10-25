extends Control

@export var transition_duration = 2

func _ready() -> void:
	Signals.Level_Complete.connect(level_complete)
	
	$"../LevelSwipe".visible = true
	_swipe_out()


func level_complete():
	$WinText.visible = true
	$NextLevelButton.visible = true


func _on_next_level_button_pressed() -> void:
	_swipe_in()
	await get_tree().create_timer(transition_duration).timeout
	Signals.emit_signal("Next_Level")
	
	
	
func _swipe_in():
	$"../LevelSwipe".position.x = 0
	var tween = get_tree().create_tween()
	tween.tween_property($"../LevelSwipe", "size:x", 1920.0, transition_duration).set_trans(Tween.TRANS_QUART)
	
func _swipe_out():
	var tween = get_tree().create_tween().set_parallel(true)
	tween.tween_property($"../LevelSwipe", "size:x", 0.0, transition_duration).set_trans(Tween.TRANS_QUART)
	tween.tween_property($"../LevelSwipe", "position:x", 1920.0, transition_duration).set_trans(Tween.TRANS_QUART)
