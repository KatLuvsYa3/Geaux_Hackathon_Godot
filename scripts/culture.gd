extends Node2D

@export var drop_count = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	get_children()[BaseScript.culture_state].visible = true
	drop_count = 0

#
## Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta: float) -> void:
	#pass


func _on_petri_area_entered(area: Area2D) -> void:
	if area.name == "Drip":
		drop_count+=1
		area.queue_free()
