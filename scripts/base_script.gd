extends Node

#use these enums with "match" keyword 
enum Minigames{
	TREADMILL,     #0, 1, 2, 3, etc..
	WEIGHTLIFTING,
	CULTURE,
	SCANNING,
	CATASTROPHE,
	MAINTANENCE,
	NOT_IN
}

@export var broken_mingames: Array[Minigames] = []

enum GameState {
	START,
	GAMEOVER,
	MINIGAME,
	IDLE
}

@export var viewport_height = 144
@export var viewport_width = 256

@export var base_energy = 6
@export var energy = base_energy

@export var bone_health = 0.8
@export var cardio_health = 0.8
@export var decay_rate = 0.2

@export var culture_state = 0
@export var research_value = 0
@export var final_research_value = 10

# in seconds
@export var initial_time = 90
@export var timer = 0
@export var year = 1
@export var final_year = 3
@export var current_minigame = Minigames.NOT_IN

var audio_controller_scene = preload("res://scenes/audio_controller.tscn").instantiate()
@export var audio_controller = null

var arm_scene = preload("res://scenes/arm.tscn").instantiate()
@export var arm = null

var display_scene = preload("res://scenes/StatDisplay.tscn").instantiate()
@export var display = null

var fade_scene = preload("res://scenes/transition.tscn").instantiate()
@export var fade = null

func _ready():
	add_child(audio_controller_scene)
	audio_controller = get_child(0)
	add_child(arm_scene)
	arm = get_child(1)
	add_child(fade_scene)
	fade = get_child(2)

func add_display():
	add_child(display_scene)
	display = get_child(3)
	display.get_child(0).max_value = base_energy
	display.get_child(0).value = base_energy
	timer = initial_time

func end_game():
	get_tree().change_scene_to_file("res://scenes/game/end_scene.tscn")

func change_energy(x):
	energy = x
	display.get_child(0).value = energy

func fade_change():
	fade.play()

func random_minigame():
	var x = randi_range(0,3)
	match x:
		0: return Minigames.TREADMILL
		1: return Minigames.CATASTROPHE
		2: return Minigames.CULTURE
		3: return Minigames.SCANNING

func new_year() -> void:
	year+=1
	display.get_child(3).text = str(year)
	if year > final_year: 
		display.queue_free()
		end_game()
	bone_health -= decay_rate
	cardio_health -= decay_rate
	broken_mingames.append(random_minigame())
	change_energy(base_energy)

func do_task(en_req: int) -> bool:
	if en_req > energy: return false
	change_energy(energy-en_req)
	return true

func maintainance_task_completed():
	broken_mingames.pop_front()

func start_minigame(game: Minigames):
	match(game):
		Minigames.CULTURE:
			$Arm/Arm.reset_pipette()
	current_minigame = game

func research_task_completed(percentage: float, max_score: int):
	research_value += percentage*max_score

func cardio_task_completed(percentage: float, max_score: int):
	cardio_health += percentage*max_score
	if cardio_health > 1.0: cardio_health = 1.0

func bone_task_completed(percentage: float, max_score: int):
	bone_health += percentage*max_score
	if bone_health > 1.0: cardio_health = 1.0

func out_of_bounds(pos: Vector2) -> bool:
	if pos.y > viewport_height or pos.y < 0: return true
	if pos.x > viewport_width or pos.x < 0: return true
	return false

## Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#pass # Replace with function body.
#

func sec_to_string(x) -> String:
	return str((int)(x/60))+":"+str(((int)(x))%60)

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	if display:
		timer-=delta
		display.get_child(5).text = sec_to_string(timer)
		if timer < 0:
			end_game()
