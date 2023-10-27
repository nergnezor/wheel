extends CharacterBody3D
const SPEED = 5.0
const JUMP_VELOCITY = 4.5
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
var linear_velocity = Vector3()
var start_position = Vector3()
func _ready():
	start_position = transform.origin
	linear_velocity = Vector3()

func _physics_process(delta):
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, 0)).normalized()
	
	linear_velocity = velocity
	print(velocity)
	# Reset to start position if too slow
	if is_on_floor() and linear_velocity.length() < 10:
		linear_velocity = Vector3()
		transform.origin = start_position
		velocity = Vector3()
	else:
		pass

	# Reset button
	if Input.is_action_just_pressed("r"):
		print("Reset")
		linear_velocity = Vector3()
		transform.origin = start_position
		velocity = Vector3()
	
