extends Node2D

#Created this script just to emit the signal to let the audio Autoload scene know when to switch, but other things can be put here for the credits

func _ready():
	Signals.emit_signal("Reach_Credits")
