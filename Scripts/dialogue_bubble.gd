extends Node2D
class_name DialogueBubble

@export var startNode = "Default"
@export var dialogueRunner: YarnDialogueRunner

func _ready() -> void:
	dialogueRunner.start_dialogue.call_deferred(startNode);

func onDialogueStarted() -> void:
	print("start")
	ACVoicebox.base_pitch = randf_range(1.5, 4.0)
	ACVoicebox.play_string(speechStrings[randi() % 3])

var shortString = "we've been trying"
var mediumString = "to reach you concerning"
var longString = "about your vehicle's extended warranty"
var speechStrings = [shortString, mediumString, longString]
