extends BaseButton

@export var scene = "res://scenes/game/main_screen.tscn"

func _on_pressed() -> void:
	get_tree().change_scene_to_file(scene)
	BaseScript.audio_controller.play_sound_from_tag("stock_pop")
