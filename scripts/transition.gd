extends Node2D

var animation_time = 0.75
var animation_timer = 1

func _ready():
	$Fade.modulate.a = 0

func _process(delta: float) -> void:
	if animation_timer < animation_time:
		animation_timer += delta
		$Fade.modulate.a = (animation_time-animation_timer)*1.0

func play():
	animation_timer = 0
