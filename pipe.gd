extends Node3D
@onready var pipe = $pipe
@onready var track = $track_1

# const N_PIPES = 1000
var tunnel_direction = Vector3(0, -1, 0)
const TUNNEL_LENGTH = 500.0
const TUNNEL_SEGMENT_HEIGHT = 1.0

func _ready():
	var path=track.get_child(0)

	var length = 0
	# var last_rotate = path.transform.basis
	while length < TUNNEL_LENGTH:
		# var follow = path.get_child(0)
		# var pos = follow.get_global_transform()
		var tunnel = pipe.duplicate()
		var new_transform = path.transform
		tunnel.transform = new_transform

		# Add 90 degrees to the x rotation
		tunnel.rotate(Vector3(1, 0, 0), PI / 2)
		add_child(tunnel)
		path.set_progress(length)
		length += TUNNEL_SEGMENT_HEIGHT


