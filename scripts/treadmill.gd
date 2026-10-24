extends Node2D

@onready var tracksObject = $Paths
@onready var paths = $Paths.get_children()
@onready var character = $Character

func _ready():
	var random_path = paths.pick_random()
	
	character.reparent(random_path)
	character.progress = 0.0
	
	for path in paths:
		if path.get_child_count() > 0:
			tracksObject.create_track(path)

func _process(delta):
	character.progress += 100.0 * delta
