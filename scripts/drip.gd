extends Area2D

var gravity_vel = Vector2.DOWN*2

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	if BaseScript.out_of_bounds(position):
		queue_free()
	position += gravity_vel
