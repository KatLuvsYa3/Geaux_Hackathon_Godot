extends Node2D

var clicked_arm

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	clicked_arm = get_parent().get_children()[1]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	position = get_global_mouse_position()
	clicked_arm.position = position
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		visible = false
		clicked_arm.visible = true
	else:
		visible = true
		clicked_arm.visible = false
