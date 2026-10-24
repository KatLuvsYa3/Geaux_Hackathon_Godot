extends BaseButton

@export var scene = "res://scenes/game/main_screen.tscn"
@export var minigame = BaseScript.Minigames.NOT_IN

func _on_pressed() -> void:
	get_tree().change_scene_to_file(scene)
	BaseScript.start_minigame(minigame)
	BaseScript.audio_controller.play_sound_from_tag("button")
