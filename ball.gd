extends RigidBody3D

@export var speed := 2.0
enum BallState { VALID, NEGATIVE }
var current_state = BallState.VALID
@onready var mesh_instance = $MeshInstance3D

func reset():
	position = Vector3.ZERO
	linear_velocity = Vector3(randf_range(-1.0,1.0),0.0,randf_range(-1.0,1.0))
	_normalize_velocity()

func _physics_process(delta):
	_normalize_velocity()
	
func _normalize_velocity():
	linear_velocity = linear_velocity.normalized()
	linear_velocity *= speed

func isBallNegative():
	return current_state == BallState.NEGATIVE

func _on_state_timer_timeout() -> void:
	if current_state == BallState.VALID:
		current_state = BallState.NEGATIVE
	else:
		current_state = BallState.VALID
	
	print("Change State!!!", current_state)
	changeBallColor()  # Call the function to update the color

func changeBallColor():
	# Get the material from the MeshInstance3D
	var mat = mesh_instance.get_surface_override_material(0)
	
	# If there's no material yet, create one and apply it
	if not mat:
		mat = StandardMaterial3D.new()
		mesh_instance.set_surface_override_material(0, mat)

	# Change color based on the state
	if current_state == BallState.NEGATIVE:
		mat.albedo_color = Color(1, 0, 0, 1)  # Red
	else:
		mat.albedo_color = Color(1, 1, 1, 1)  # Whitee
