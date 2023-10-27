extends RigidBody3D
const SPEED = 5.0
const JUMP_VELOCITY = 4.5

var paused = false
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
# var linear_velocity = Vector3()
var start_transform
func _ready():
	start_transform = transform

func _physics_process(delta):
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, 0)).normalized()
	
	# Reset button
	if Input.is_action_just_pressed("ui_focus_next"):
		print("Reset")
		transform = start_transform
		var camera = get_node("../camera")
		camera.transform.origin = start_transform.origin
		linear_velocity = Vector3()
		angular_velocity = Vector3()

	# Pause if space is pressed
	if Input.is_action_just_pressed("ui_accept"):
		paused = !paused
		print("Paused: ", paused)
	
	if paused: 
		linear_velocity = Vector3()
		angular_velocity = Vector3()
	
	
