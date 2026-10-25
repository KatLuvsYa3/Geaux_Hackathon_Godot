extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	$Percentage.text = str(BaseScript.cardio_health*100)+"%"


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_finish_pressed() -> void:
	BaseScript.do_task(1)
	$Finish._on_pressed()
