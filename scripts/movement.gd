extends CharacterBody2D

@export var max_speed = 400
@export var move_acc_speed = 100

@onready var _animated_sprite = $AnimatedSprite2D
@onready var _collision_shape = $CollisionShape2D
var movements = ["move_left", "move_right", "move_up", "move_down"]

#PHYSICS
#added to make movement smooth
var acceleration: Vector2 = Vector2.ZERO
var walking_velocity: Vector2 = Vector2.ZERO

#input stuff
func movementKeysPressed(movementList: Array):
	for action in movementList:
		if Input.is_action_pressed(action):
			return true
	return false

func get_input(delta):
	var input_direction = Input.get_vector(movements[0],movements[1],movements[2],movements[3])
	walking_velocity += input_direction*(1-delta)*move_acc_speed
	if walking_velocity.length() > max_speed:
		walking_velocity = walking_velocity.normalized()*max_speed
	if velocity.length() < walking_velocity.length():
		velocity = walking_velocity
	walking_velocity *= 0.90*(1-delta)

#physisics
func apply_force(f: Vector2):
	acceleration += f

func apply_acceleration(delta):
	velocity += acceleration*(1-delta)

func friction(delta):
	acceleration *= 0.80*(1-delta)
	velocity *= 0.90*(1-delta)

#process
func _physics_process(delta):
	get_input(delta)
	apply_acceleration(delta)
	friction(delta)
	
	
	#animation management
	if movementKeysPressed(movements):
		_animated_sprite.play()
	else:
		_animated_sprite.stop()
	
	if velocity.normalized().x < 0:
		_collision_shape.position.x = -5
		_animated_sprite.flip_h = true
	else:
		_collision_shape.position.x = 3
		_animated_sprite.flip_h = false
	
	move_and_slide()
