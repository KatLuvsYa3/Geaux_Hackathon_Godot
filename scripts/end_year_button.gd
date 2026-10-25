extends Button

func _on_pressed() -> void:
	BaseScript.new_year()
	if BaseScript.year < BaseScript.final_year+1:
		get_tree().change_scene_to_file("res://scenes/game/next_year.tscn")
		BaseScript.start_minigame(BaseScript.Minigames.NOT_IN)
		BaseScript.audio_controller.play_sound_from_tag("button")
		BaseScript.fade_change()
