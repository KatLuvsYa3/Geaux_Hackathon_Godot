extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for m in BaseScript.broken_mingames:
		if m != BaseScript.Minigames.CULTURE and m != BaseScript.Minigames.SCANNING:
			continue
		var b = $BrokenThingPart.duplicate()
		b.set_broken(m)
		add_child(b)
