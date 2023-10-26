extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/3d/default_gravity")

# Add camera to the player.
# onready var camera = $Camera3D

# Add camera to the player.
# @onready var camera = $Camera3D

# func _ready():
# 	# Set the camera's translation to the player's translation.
# 	#check if camera is not null
# 	if camera:
# 		camera.translation = Vector3(0, 5, velocity.z)

func _physics_process(delta):
	# Add the gravity.
	# if is_on_floor():
	# 	# velocity.y *= 0.8
	# 	print("on floor")
	# else:
	# 	velocity.y -= gravity * delta


	# # Handle Jump.
	# if Input.is_action_just_pressed("ui_accept") and is_on_floor():
	# 	velocity.y = JUMP_VELOCITY

	# # Get the input direction and handle the movement/deceleration.
	# # As good practice, you should replace UI actions with custom gameplay actions.
	# var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	# var direction = (transform.basis * Vector3(input_dir.x, 0, 0)).normalized()
	# if direction:
	# 	velocity.x = direction.x * SPEED
	# 	velocity.z = direction.z * SPEED
	# else:
	# 	velocity.x = move_toward(velocity.x, 0, SPEED)
	# 	velocity.z = move_toward(velocity.z, 0, SPEED)
		
	# # print(velocity)
	# move_and_slide()
	# print(position)

	# Make the camera follow the player.
	#check if camera is not null
	# if camera:
	# 	camera.translation = Vector3(0, 0, velocity.z)
