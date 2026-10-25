extends Node2D

var timer = 0
var length = 2

# Called when the node enters the scene tree for the first time.
func _process(delta: float) -> void:
	timer+=delta
	if timer > length:
		get_tree().change_scene_to_file("res://scenes/game/main_screen.tscn")
		BaseScript.start_minigame(BaseScript.Minigames.NOT_IN)
		BaseScript.audio_controller.play_sound_from_tag("crash")
		BaseScript.fade_change()
