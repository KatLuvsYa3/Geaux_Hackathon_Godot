extends Sprite2D

var attatched = false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if attatched: position = get_global_mouse_position()
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		attatched = false


func _on_area_2d_mouse_entered() -> void:
	print("HIYT")
	attatched = true
