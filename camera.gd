extends Camera3D

const SPEED = 20.0

@onready var player = get_node("../player")

var initial_transform = null
# Called when the node enters the scene tree for the first time.
func _ready():
	# Store the initial camera transform for later use.
	initial_transform = transform


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()

	# Follow player
	# var player = get_node("/root/player")
	if player == null:
		return
	if initial_transform == null:
		return
	# Set the camera offset from the initial offset.
	var target = player.global_transform.origin + initial_transform.origin
	var camera_pos = transform.origin
	var camera_to_target = target - camera_pos
	var camera_to_target_normal = camera_to_target.normalized()
	var distance_to_target = camera_to_target.length()
	var distance_to_move = SPEED * delta
	if distance_to_move > distance_to_target:
		distance_to_move = distance_to_target
	var new_camera_pos = camera_pos + camera_to_target_normal * distance_to_move
	transform.origin = new_camera_pos

