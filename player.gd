extends RigidBody3D
const SPEED = 5.0
const JUMP_VELOCITY = 4.5

var paused = false
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
# var linear_velocity = Vector3()
var start_transform
var was_pressed = false
var spin_direction = 1

func _ready():
	start_transform = transform

func _physics_process(delta):

	# Reset button
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT):
		print("Reset")
		transform = start_transform
		var camera = get_node("../camera")
		camera.transform.origin = start_transform.origin
		linear_velocity = Vector3()
		angular_velocity = Vector3()

	# Pause if space is pressed
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		apply_torque(Vector3(1*spin_direction,0, 0) * 100)
		was_pressed = true
	elif was_pressed:
		was_pressed = false
#		spin_direction *= -1
		
	
	if paused: 
		linear_velocity = Vector3()
		angular_velocity = Vector3()
	
