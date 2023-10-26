extends Camera3D

const SPEED = 5.0

@onready var player = get_node("../player")

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()

	# Follow player
	# var player = get_node("/root/player")
	if player == null:
		return
	print(player.global_transform.origin)
	var target = player.global_transform.origin + Vector3(0, 2, 0)
	var camera_pos = transform.origin
	var camera_to_target = target - camera_pos
	var camera_to_target_normal = camera_to_target.normalized()
	var distance_to_target = camera_to_target.length()
	var distance_to_move = SPEED * delta
	if distance_to_move > distance_to_target:
		distance_to_move = distance_to_target
	var new_camera_pos = camera_pos + camera_to_target_normal * distance_to_move
	transform.origin = new_camera_pos

