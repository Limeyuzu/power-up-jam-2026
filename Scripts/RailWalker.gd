@tool
extends AnimatableBody2D

@export var distance:Vector2
@export var phase_time: float = 6.0
@export_range(0.0, 1.0) var phase_offset:float

func _ready() -> void:
	pivot = global_position
	time += phase_offset

var pivot:Vector2
var time:float
	
func get_pos(t:float)->Vector2:
	#var x:float = pivot.x + cos(TAU * (t + phase_offset) * distance.x)
	var x:float = pivot.x + sin(TAU * t) * distance.x
	var y:float = pivot.y + sin(TAU * t) * distance.y
	return Vector2(x,y)

func _physics_process(delta:float)->void:
	if not Engine.is_editor_hint():
		time = fmod(time + delta/phase_time, 1.0)
		global_position = get_pos(time)
	
func _process(_delta):
	if Engine.is_editor_hint():
		queue_redraw()
	
func _draw()->void:
	if not Engine.is_editor_hint():
		return
	var resolution:int = 20
	var increments:float = 1.0/resolution
	for i in resolution:
		var a = get_pos(increments * i) - global_position
		var b = get_pos(increments * (i+1)) - global_position
		draw_line(a,b, Color.WHITE, -1 )
