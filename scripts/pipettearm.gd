extends Sprite2D

var pipe_speed = 40
var drip_time = 0.4
var drip_timer = 0

var drip_scene = preload("res://scenes/drip.tscn")

#greeen around 42%

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if visible:
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			$graphicbar.value -= (delta)*pipe_speed
			if $graphicbar.value == 0: return 
			drip_timer += delta
			if drip_timer > drip_time:
				drip_timer -= drip_time
				var instance = drip_scene.instantiate()
				instance.position = $TipArea/CollisionShape2D.global_position
				get_tree().root.get_child(1).add_child(instance)
