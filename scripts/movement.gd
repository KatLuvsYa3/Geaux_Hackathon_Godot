extends CharacterBody2D

@export var speed = 400
@onready var _animated_sprite = $AnimatedSprite2D
var movements = ["move_left", "move_right", "move_up", "move_down"]

func movementKeysPressed(movementList: Array):
	for action in movementList:
		if Input.is_action_pressed(action):
			return true
	return false


func get_input():
	var input_direction = Input.get_vector(movements[0],movements[1],movements[2],movements[3])
	velocity = input_direction * speed

func _physics_process(delta):
	get_input()
	
	if movementKeysPressed(movements):
		_animated_sprite.play()
	else:
		_animated_sprite.stop()
	
	
	move_and_slide()
