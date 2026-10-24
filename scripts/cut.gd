extends Sprite2D

@export var id = 0
var radius = 4

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if get_global_mouse_position().distance_to(global_position) <= radius:
		$"../".fill(id)
