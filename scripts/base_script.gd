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


enum GameState {
	START,
	GAMEOVER,
	MINIGAME,
	IDLE
}


@export var base_energy = 6
@export var energy = base_energy

@export var bone_health = 0.8
@export var cardio_health = 0.8
@export var decay_rate = 0.2

@export var culture_state = 0
@export var research_value = 0
@export var final_research_value = 10

@export var year = 1
@export var final_year = 3
@export var current_minigame = Minigames.NOT_IN

var audio_controller_scene = preload("res://scenes/audio_controller.tscn").instantiate()
@export var audio_controller = null

var arm_scene = preload("res://scenes/arm.tscn").instantiate()
@export var arm = null

func _ready():
	add_child(audio_controller_scene)
	audio_controller = get_child(0)
	add_child(arm_scene)
	arm = get_child(1)

func end_game():
	get_tree().change_scene_to_file("res://scenes/game/end_scene.tscn")

func new_year() -> void:
	year+=1
	if year > final_year: end_game()
	bone_health -= decay_rate
	cardio_health -= decay_rate
	energy = base_energy

func do_task(en_req: int) -> bool:
	if en_req > energy: return false
	energy-=en_req
	return true

func research_task_completed(percentage: float, max_score: int):
	research_value += percentage*max_score

func cardio_task_completed(percentage: float, max_score: int):
	cardio_health += percentage*max_score
	if cardio_health > 1.0: cardio_health = 1.0

func bone_task_completed(percentage: float, max_score: int):
	bone_health += percentage*max_score
	if bone_health > 1.0: cardio_health = 1.0

## Called when the node enters the scene tree for the first time.
#func _ready() -> void:
	#pass # Replace with function body.
#
#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass
