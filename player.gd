extends RigidBody3D
@onready var orb: MeshInstance3D = $orb
@onready var camera = get_node("../camera")
@onready var shape: CollisionShape3D = $shape

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
		camera.transform.origin = start_transform.origin
		linear_velocity = Vector3()
		angular_velocity = Vector3()

	var rot = get_rotation()
	# Pause if space is pressed
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT) or Input.is_physical_key_pressed(KEY_D):
		apply_torque(Vector3(1*spin_direction,0, 0) * 10)
		# Set emission color of material
		material.emission = Color(0.2,0.5,1)
		
		was_pressed = true
	elif was_pressed:
		material.emission = Color(1,0.8,0)
		was_pressed = false
		
		
	var coll = get_colliding_bodies()



func _on_body_entered(body):
	print("fevej")


func _on_body_exited(body):
	print(body)
