extends CPUParticles2D

func repair():
	emitting = false

func set_broken(mini):
	print("hit")
	emitting = true
	match mini:
		BaseScript.Minigames.TREADMILL:
			position = Vector2(193, 99)
		BaseScript.Minigames.CULTURE:
			position = Vector2(21, 67)
		BaseScript.Minigames.SCANNING:
			position = Vector2(41, 67)
		BaseScript.Minigames.CATASTROPHE:
			position = Vector2(41, 67)
