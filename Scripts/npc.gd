extends Node2D

@export_enum("Top Right", "Bottom Right", "Bottom Left", "Top Left") var dialogueOrientation = 0
@export var dialogueBubble: DialogueBubble

var seenPlayer = false

func _ready() -> void:
	dialogueBubble.setOrientation(dialogueOrientation)

func onDetectedPlayer(body: Node2D) -> void:
	if not seenPlayer:
		dialogueBubble.startDialogue()
		seenPlayer = true
