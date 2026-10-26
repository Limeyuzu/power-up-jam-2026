extends Node2D

@export_enum("Top Right", "Bottom Right", "Bottom Left", "Top Left") var dialogueOrientation = 0
@export var dialogueBubble: DialogueBubble



func _ready() -> void:
	print("set orien", dialogueOrientation)
	dialogueBubble.setOrientation(dialogueOrientation)
