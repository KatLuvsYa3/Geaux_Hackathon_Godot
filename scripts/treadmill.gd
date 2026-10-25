extends Node2D

@onready var tracksObject = $Paths
@onready var paths = $Paths.get_children()
@onready var character = $Character
@onready var baseScript = $/root/BaseScript
var minigameStart: bool = false

var movementCount = 0


@export var speed: float = 1.0
var acceleration: float = 0

func _ready():
	var random_path = paths.pick_random()
	character.reparent(random_path)
	character.progress = 0.0
	
	for path in paths:
		if path.get_child_count() > 0:
			tracksObject.create_track(path)

func _process(delta):
	if movementCount % 50 == 0:
		acceleration += randi_range(-2,2)
		print(randi_range(-2,2))
		if acceleration > 5:
			acceleration = 5
		if acceleration < -5:
			acceleration = -5
		
		speed += acceleration
		
		if speed > 100:
			speed = 100
		if speed < 15:
			speed = 15
		
		print("Speed: ", speed)
		print("Acceleration: ", acceleration)
	

	
	movementCount += 1
	
	
	
	if minigameStart:
		character.progress += speed * delta


func mouseEntered() -> void:
	print("Mouse Entered")


func mouseExited() -> void:
	print("Mouse Exited")
	if minigameStart:
		minigameStart = false
		baseScript.cardio_task_completed(character.progress_ratio, 10)
		


func OnClick(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			minigameStart = true
