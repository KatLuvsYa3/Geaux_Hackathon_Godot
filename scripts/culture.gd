extends Node2D

@export var drop_count = 0
var right_drop_amount = 3

@onready var word_gauage = $"Word Guage"

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_children()[BaseScript.culture_state].visible = true
	drop_count = 0
	word_gauage.text = "Hungry.."
	

#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass


func _on_petri_area_entered(area: Area2D) -> void:
	if area.name == "Drip":
		drop_count+=1
		area.queue_free()
		match drop_count:
			0: word_gauage.text = "Hungry.."
			1: word_gauage.text = "Not Enough"
			2: word_gauage.text = "Little More"
			3: word_gauage.text = "Perfect!"
			_: word_gauage.text = "Too Much!"


func _on_back_to_main_pressed() -> void:
	var percentage = 1.0-0.5*(right_drop_amount-drop_count)
	BaseScript.research_task_completed(percentage, 3)
	BaseScript.do_task(2)
