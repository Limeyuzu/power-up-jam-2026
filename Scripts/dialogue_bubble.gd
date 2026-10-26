extends Node2D
class_name DialogueBubble

@export var startNode = "Default"
@export var dialogueRunner: YarnDialogueRunner
@export var bubbleTexture: NinePatchRect
@export var parentPanel: Control

var initialPanelSize: Vector2
var panelDistanceFromOrigin = 20

func _ready() -> void:
	initialPanelSize = parentPanel.size
	
func startDialogue() -> void:
	dialogueRunner.start_dialogue.call_deferred(startNode)

func onDialogueStarted() -> void:
	ACVoicebox.base_pitch = randf_range(1.5, 4.0)
	ACVoicebox.play_string(speechStrings[randi() % 3])
	
func setOrientation(orientation) -> void:
	bubbleTexture.offset_transform_scale = getScaleFromOrientation(orientation)
	parentPanel.position = getPositionFromOrientation(orientation)
	
func getScaleFromOrientation(orientation) -> Vector2:
	match orientation:
		0:
			return Vector2(1, 1)
		1:
			return Vector2(1, -1)
		2:
			return Vector2(-1, -1)
		3:
			return Vector2(-1, 1) 
	return Vector2(1, 1)
	
func getPositionFromOrientation(orientation) -> Vector2:
	match orientation:
		0:
			return Vector2(panelDistanceFromOrigin, -(initialPanelSize.y + panelDistanceFromOrigin))
		1:
			return Vector2(panelDistanceFromOrigin, panelDistanceFromOrigin)
		2:
			return Vector2(-(initialPanelSize.x + panelDistanceFromOrigin), panelDistanceFromOrigin)
		3:
			return Vector2(-(initialPanelSize.x + panelDistanceFromOrigin), -(initialPanelSize.y + panelDistanceFromOrigin)) 
	return Vector2(panelDistanceFromOrigin, -(initialPanelSize.y + panelDistanceFromOrigin))

var shortString = "we've been trying"
var mediumString = "to reach you concerning"
var longString = "about your vehicle's extended warranty"
var speechStrings = [shortString, mediumString, longString]
