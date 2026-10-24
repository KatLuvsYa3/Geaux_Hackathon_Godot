extends Node2D

var clicked_arm
var pipe_arm

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	clicked_arm = get_parent().get_children()[1]
	pipe_arm = get_parent().get_children()[2]

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _physics_process(delta: float) -> void:
	position = get_global_mouse_position()
	clicked_arm.position = position
	match(BaseScript.current_minigame):
		BaseScript.Minigames.CULTURE:
			pipe_arm.visible = true
			pipe_arm.position = position
			clicked_arm.visible = false
			visible = false
		_:
			pipe_arm.visible = false
			if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
				visible = false
				clicked_arm.visible = true
			else:
				visible = true
				clicked_arm.visible = false
