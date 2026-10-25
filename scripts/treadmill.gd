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
	
	if !minigameStart:
		return
	
	current_ratio = character.progress_ratio
	
	if movementCount % 50 == 0:
		acceleration += .1
		if acceleration > 5:
			acceleration = 5
		
		speed += acceleration
		
		if speed > 100:
			speed = 100
	
	movementCount += 1
	character.progress += speed * delta
	
	if current_ratio < last_ratio:
		loopCount += 1
		if loopCount == 3:
			minigameStart = false
			#change text as needed
		
	last_ratio = current_ratio


func mouseEntered() -> void:
	print("Mouse Entered")


func mouseExited() -> void:
	print("Mouse Exited")
	if minigameStart:
		minigameStart = false
	
	
	#Set text to try agaub or something


func OnClick(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			if movementCount == 0:
				minigameStart = true
			return

# PUT RESULT OF GAME HERE
# IE ENERGY SPENT AND ADDING SCORE TO BASE.CARDIO
func _on_back_to_main_pressed() -> void:
	BaseScript.cardio_task_completed((1/3) * loopCount, 10)
	BaseScript.do_task(1)
	$BackToMain._on_pressed()
