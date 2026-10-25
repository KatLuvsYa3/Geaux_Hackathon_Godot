extends CPUParticles2D


func set_broken(mini):
	emitting = true
	match mini:
		BaseScript.Minigames.CULTURE:
			global_position = Vector2(51, 83)
		BaseScript.Minigames.SCANNING:
			global_position = Vector2(147, 83)
