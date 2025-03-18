extends Node3D

@export var rotation_speed = 3.0
@onready var ball = $"../Ball"
@onready var ai_controller = $AIController3D

func _ready():
	ai_controller.init(self)

func game_over():
	get_parent().add_score(-1)
	ai_controller.reward -= 1
	ai_controller.done = true
	ai_controller.needs_reset = true

func _physics_process(delta):
	if ai_controller.needs_reset:
		ai_controller.reset()
		ball.reset()
		return

	var movement : float
	if ai_controller.heuristic == "human":
		movement = Input.get_axis("rotate_anticlockwise", "rotate_clockwise")
	else:
		movement = ai_controller.move_action
	rotate_y(movement*delta*rotation_speed)

func _on_area_3d_body_entered(body):
	if ball.isBallNegative():
		get_parent().add_score(-3)
		ai_controller.reward -= 3.0
	else:
		get_parent().add_score(1)
		ai_controller.reward += 1.0
	
