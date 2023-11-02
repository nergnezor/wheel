extends RigidBody3D
@onready var orb: MeshInstance3D = $orb

var paused = false
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
# var linear_velocity = Vector3()
var start_transform
var was_pressed = false
var spin_direction = 1
var material: StandardMaterial3D
func _ready():
	start_transform = transform
	material = orb.get_active_material(0)
func _physics_process(delta):

	# Reset button
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT) or Input.is_action_just_pressed("ui_text_clear_carets_and_selection"):
		print("Reset")
		transform = start_transform
		var camera = get_node("../camera")
		camera.transform.origin = start_transform.origin
		linear_velocity = Vector3()
		angular_velocity = Vector3()

	# Pause if space is pressed
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) or Input.is_physical_key_pressed(KEY_D):
		apply_torque(Vector3(1*spin_direction,0, 0) * 10)
		# Set emission color of material
		material.emission = Color(0.2,0.5,1)
		
		was_pressed = true
		# Lock rotation
		# print(rot)
		# rot.x = 0
		# rot.z = 90
	elif was_pressed:
		material.emission = Color(1,0.8,0)
		was_pressed = false
		
	var rotation_global = global_transform.basis.get_euler()
	var rot = get_rotation()
	rot.x = 1
	var lean_right = Input.is_action_pressed("ui_right")
	var lean_left = Input.is_action_pressed("ui_left")
	if lean_left:
		# Push to right
		apply_torque(Vector3(0,0, -1) * 10)
	if lean_right:
		# Push to left
		apply_torque(Vector3(0,0, 1) * 10)
#	apply_torque(Vector3(0,-1, -1) * 10)
	
	# rot.y = rotation_global.y
#	set_rotation(rot)
#	rotation.z = rotation.z + PI/2
	

