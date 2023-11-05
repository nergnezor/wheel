extends RigidBody3D
@onready var orb: MeshInstance3D = $orb
@onready var camera = get_node("../camera")
@onready var win_label: Label3D = get_node("../camera/win_label")
@onready var time_label: Label3D = get_node("../camera/time")
var timer = 0
const TIMEOUT = 10
var time_since_start = 0

var paused = false
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")
# var linear_velocity = Vector3()
var start_transform
var was_pressed = false
var spin_direction = 1
var material: StandardMaterial3D
var rotate_progress = 1
var win_progress = 1

func _ready():
	start_transform = transform
	material = orb.get_active_material(0)
func _physics_process(delta):

	# Reset button
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_RIGHT) or Input.is_action_just_pressed("ui_text_clear_carets_and_selection"):
		reset()

	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		apply_torque(Vector3(1*spin_direction,0, 0) * 10)
		# Set emission color of material
		material.emission = Color(0.2,0.5,1)
		was_pressed = true
	elif was_pressed:
		material.emission = Color(1,0.8,0)
		was_pressed = false
		# Switch gravity
		gravity *= -1
		set_gravity()
		spin_direction *= -1
	
	var colliding = get_colliding_bodies()
	if (colliding.size() > 0):
		if (colliding[0].get_name() == "goal"):
			win()
		timer = 0
		return
	
	timer += delta
	if (timer > TIMEOUT):
		reset()
	time_since_start += delta
	var tenths: int = round(time_since_start*10)
	tenths = tenths % 10
	var seconds = round(time_since_start)
	time_label.text = str(seconds)+"."+str(tenths)

func reset():
	print("Reset")
	time_since_start = 0
	spin_direction = 1
	timer = 0
	gravity = 9.8
	set_gravity()
	transform = start_transform
	camera.transform.origin = start_transform.origin
	linear_velocity = Vector3()
	angular_velocity = Vector3()
	win_label.hide()
	
func win():
	print("Win")
	win_label.show()
	linear_velocity = Vector3()
	angular_velocity = Vector3()
	timer = 0
	
func set_gravity():
	PhysicsServer3D.area_set_param(get_world_3d().get_space(), PhysicsServer3D.AREA_PARAM_GRAVITY, gravity)
