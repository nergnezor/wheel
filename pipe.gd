extends Node3D
@onready var pipe = $pipe
const N_PIPES = 1000

func _ready(): 
	var last_end_position = pipe.transform.origin + Vector3(0, -10, 0)
	for i in range(1, N_PIPES):
		print("copying ", i)
		duplicate_below(pipe,i)
		
		
func duplicate_below(org,i):
	var another = org.duplicate()
	another.rotate_x(0.01*i)
	another.transform.origin.z = 0.1*i
	var y_rotate_offset = 0.01*i
	var bottom = Vector3(0, -1*i + y_rotate_offset, 0)
	another.transform.origin = bottom
	add_child(another)

