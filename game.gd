extends Node3D

var score = 0
@onready var score_label = $TextSprite/SubViewport/ScoreLabel
@onready var ball = $Ball

func _ready():
	randomize()
	update_score_display()

func _on_ring_body_entered(body):
	if (ball.isBallNegative()):
		ball.reset()
		return
	$Player.game_over()
	
func add_score(points):
	score += points
	update_score_display()

func update_score_display():
	score_label.text = "Score: " + str(score)
	
