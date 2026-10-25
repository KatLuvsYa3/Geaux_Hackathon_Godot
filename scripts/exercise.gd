extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for m in BaseScript.broken_mingames:
		if m == BaseScript.Minigames.TREADMILL:
			$BrokenThingPart.emitting = true
