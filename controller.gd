extends AIController3D

# Stores the action sampled for the agent's policy, running in python
var move_action : float = 0.0

func get_obs() -> Dictionary:
	# get the balls position and velocity in the paddle's frame of reference
	var ball_pos = to_local(_player.ball.global_position)
	var ball_vel = to_local(_player.ball.linear_velocity)
	
	var ball_state = 1.0 if _player.ball.isBallNegative() else 0.0
	
	var obs = [ball_pos.x, ball_pos.z, ball_vel.x/10.0, ball_vel.z/10.0, ball_state]

	return {"obs":obs}

func get_reward() -> float:
	return reward

func get_action_space() -> Dictionary:
	return {
		"move_action" : {
			"size": 1,
			"action_type": "continuous"
		},
	}

func set_action(action) -> void:
	move_action = clamp(action["move_action"][0], -1.0, 1.0)
