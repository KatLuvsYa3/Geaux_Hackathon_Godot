extends Node2D

@export var track_width: float = 24.0
@export var track_color: Color = Color(0.85, 0.85, 0.9, 0.3)


func create_track(path: Path2D):
	if path.curve == null:
		return

	var track = Line2D.new()
	track.name = "SliderTrack"

	#drawing track
	track.points = path.curve.get_baked_points()

	#appearance
	track.width = track_width
	track.default_color = track_color
	track.joint_mode = Line2D.LINE_JOINT_ROUND
	track.begin_cap_mode = Line2D.LINE_CAP_ROUND
	track.end_cap_mode = Line2D.LINE_CAP_ROUND

	# makes slider behind circle
	track.z_index = -1

	path.add_child(track)
