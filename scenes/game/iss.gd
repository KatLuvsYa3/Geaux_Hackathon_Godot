extends Sprite2D

var base_position
@export var variation = 2
@export var speed = 0.001

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	base_position = position


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	position = base_position + (Vector2.RIGHT+Vector2.UP)*variation*sin(Time.get_ticks_msec()*speed)
