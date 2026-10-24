extends Node2D

var filled = 0
var total = 7

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass

func fill(x):
	if get_child(x).get_child_count() < 2:
		filled+=1
		get_child(x).add_child($"../WiresUncut".duplicate())
		get_child(x).get_child(0).visible = true
		get_child(x).get_child(0).global_scale = Vector2.ONE
		get_child(x).get_child(0).global_position.x = BaseScript.viewport_width/2
		get_child(x).get_child(0).global_position.y = BaseScript.viewport_height/2
