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
		get_child(x).get_child(1).visible = true
		get_child(x).get_child(1).global_scale = Vector2.ONE
		get_child(x).get_child(1).global_position.x = BaseScript.viewport_width/2
		get_child(x).get_child(1).global_position.y = BaseScript.viewport_height/2

func _on_area_2d_mouse_entered1() -> void:
	fill(0)

func _on_area_2d_mouse_entered2() -> void:
	fill(1)

func _on_area_2d_mouse_entered3() -> void:
	fill(2)

func _on_area_2d_mouse_entered4() -> void:
	fill(3)

func _on_area_2d_mouse_entered5() -> void:
	fill(4)

func _on_area_2d_mouse_entered6() -> void:
	fill(5)

func _on_area_2d_mouse_entered7() -> void:
	fill(6)
