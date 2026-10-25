extends Control

func _ready() -> void:
	Signals.Level_Complete.connect(level_complete)

func level_complete():
	$WinText.visible = true


func _on_next_level_button_pressed() -> void:
	Signals.emit_signal("NextLevel")
