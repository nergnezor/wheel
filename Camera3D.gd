extends Camera3D

const SPEED = 5.0

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	var input_dir = Input.get_vector("ui_left", "ui_right", "ui_up", "ui_down")
	var direction = (transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()

	# Lock x rotation
	var x_rot = transform.basis.x
	x_rot.x = -56.0
	transform.basis.x = x_rot
	print(transform.basis.x)
	# if direction:
	# 	position += direction * SPEED * delta
	# else:
	# 	print("No direction")

	
