extends Node2D

@onready var tracksObject = $Paths
@onready var paths = $Paths.get_children()
@onready var character = $Character
@onready var baseScript = $/root/BaseScript
var minigameStart: bool = false
var loopCount = 0
var movementCount = 0
var last_ratio = 0
var current_ratio = 0

@export var max_speed: int = 66
@export var speed: float = 1.0
var acceleration: float = 0

var radius = 13
var on_point = false

func _ready():
	var random_path = paths.pick_random()
	character.reparent(random_path)
	character.progress = 0.0
	
	for path in paths:
		if path.get_child_count() > 0:
			tracksObject.create_track(path)

func _process(delta):
	
	# checking mouse
	if character.global_position.distance_to(get_global_mouse_position()) <= radius:
		# MOUSE_CLICKED
		if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
			if movementCount == 0:
				minigameStart = true
		if !on_point:
			on_point = true
			# MOUSE_ENTERED
			mouseEntered()
	else:
		# MOUSE_EXITED
		if on_point:
			on_point = false
		if minigameStart:
			mouseExited()
	
	#TEXT
	#display loop count
	$LoopCount.text = str(loopCount)+"/3"
	
	#Motivation text (needed holy fuck its hard)
	
	#exit move if not active
	if !minigameStart:
		return
	
	#move thing
	current_ratio = character.progress_ratio
	
	if movementCount % 50 == 0:
		acceleration += .1
		if acceleration > 5:
			acceleration = 5
		
		speed += acceleration
		
		if speed > max_speed:
			speed = max_speed
	
	movementCount += 1
	character.progress += speed * delta
	
	if current_ratio < last_ratio:
		loopCount += 1
		if loopCount == 3:
			minigameStart = false
			#change text as needed
			$MotivationText.text = "Great Workout!"
		
	last_ratio = current_ratio
	


func mouseEntered() -> void:
	print("Mouse Entered")
	
	#FINISH TEXT


func mouseExited() -> void:
	print("Mouse Exited")
	if minigameStart:
		minigameStart = false
	

# PUT RESULT OF GAME HERE
# IE ENERGY SPENT AND ADDING SCORE TO BASE.CARDIO
func _on_back_to_main_pressed() -> void:
	baseScript.cardio_task_completed(loopCount/3.0, 15)
	BaseScript.do_task(2)
	$BackToMain._on_pressed() #keep to stop signal race
