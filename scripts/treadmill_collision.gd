extends Area2D

var onCircle: bool

func _ready() -> void:
	mouse_entered.connect(onMouseEntered)
	mouse_exited.connect(onMouseExited)
	
func onMouseEntered():
	onCircle = true
	print("Mouse entered")


func onMouseExited():
	onCircle = false
	print("Mouse exited")


#func _process(delta):
	#print(global_position)
