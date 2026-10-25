extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.

func _on_finish_pressed() -> void:
	var percentage = $Cuts.filled/$Cuts.total
	if percentage == 1: BaseScript.maintainance_task_completed()
	else: print("loser")
	BaseScript.do_task(2)
	$Finish._on_pressed()
