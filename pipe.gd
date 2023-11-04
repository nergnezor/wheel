extends Node3D
@onready var pipe = $pipe
@onready var track = $track

const TUNNEL_SEGMENT_HEIGHT = 1

func _ready():
	var track_parts = track.get_children()
	for track in track_parts:
		var track_location = track.transform.origin
		var path: PathFollow3D = track.get_child(0)
		path.set_progress_ratio(1.0)
		var track_length = path.get_progress()
#		path.set_progress_ratio(0.0)
		var length = TUNNEL_SEGMENT_HEIGHT
		while length < track_length:
			path.set_progress(length)
			var tunnel = pipe.duplicate()
			var new_transform = path.transform
			new_transform.origin += track_location
			tunnel.transform = new_transform

			# Add 90 degrees to the x rotation
			tunnel.rotate(Vector3(1, 0, 0), PI / 2)
			add_child(tunnel)
			length += TUNNEL_SEGMENT_HEIGHT

	remove_child(pipe)


