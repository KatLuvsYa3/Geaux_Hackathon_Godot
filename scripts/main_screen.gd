extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	for m in BaseScript.broken_mingames:
		var b = $BrokenThingPart.duplicate()
		b.set_broken(m)
		add_child(b)
