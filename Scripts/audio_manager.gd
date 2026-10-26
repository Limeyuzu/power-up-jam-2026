extends Node2D


func _ready():
	Signals.Reach_Credits.connect(_switch_music_to_credits)
	
func _switch_music_to_credits():
	$LevelMusic.stop()
	$CrowdNoise.stop()
	$CreditsMusic.play()
