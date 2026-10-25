extends Node2D

@export var timer_length = 2.0
@export var timer_mid_length = 1.0
var timer = 0

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	if BaseScript.cardio_health < 0.5:
		$Enddead.visible = true
	elif BaseScript.cardio_health < 0.8:
		$Aliveend.visible = true
	else: $Strongend.visible = true
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	timer+=delta
	if timer > timer_mid_length:
		if BaseScript.research_value < 0.4: 
			$Firedend.visible = true
			$Firedend.modulate.a = min(timer_length-timer_mid_length, timer-timer_mid_length)
		elif BaseScript.research_value < 0.8:
			$Okayend.visible = true
			$Okayend.modulate.a = min(timer_length-timer_mid_length, timer-timer_mid_length)
		else: 
			$Greatend.visible = true
			$Greatend.modulate.a = min(timer_length-timer_mid_length, timer-timer_mid_length)
