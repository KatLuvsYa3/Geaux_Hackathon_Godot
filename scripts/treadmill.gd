extends Node2D

@onready var paths = $Paths.get_children()
@onready var character = $Character

func _ready():
	var random_path = paths.pick_random()
	
	character.reparent(random_path)
	character.progress = 0.0

func _process(delta):
	character.progress += 100.0 * delta
