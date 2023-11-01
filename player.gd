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
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT) or Input.is_action_just_pressed("ui_end"):
		print("Reset")
		transform = start_transform
		var camera = get_node("../camera")
		camera.transform.origin = start_transform.origin
		linear_velocity = Vector3()
		angular_velocity = Vector3()

	# Pause if space is pressed
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		apply_torque(Vector3(1*spin_direction,0, 0) * 100)
		# Set emission color of material

		material.emission = Color(0.2,0.5,1)
		
		was_pressed = true
	elif was_pressed:
		material.emission = Color(1,0.8,0)
		was_pressed = false
#		spin_direction *= -1
		
	
	var angle = get_rotation_degrees().z
	const MAXANGLE:int = 360
	while angle < 0:
		angle += MAXANGLE
	angle -= 90
#	var switch = false
#	if angle > 90:
#		angle -= 180
#		switch = true
	print("Lean angle: ", angle)
	# Handle negative angles
	if abs(angle) > 2 and abs(angle) <90:
		if angle < 0:
			# rotate_z(0.1)
			apply_torque(Vector3(0,0, 1) * 100)
		else:
			# rotate_z(-0.1)
			apply_torque(Vector3(0,0, -1) * 100)
#		apply_torque(Vector3(0,0, 1) * 100*-lean_angle)
		# spin_direction *= -1
