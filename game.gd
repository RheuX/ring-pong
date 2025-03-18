extends Node3D

var score = 0
@onready var score_label = $Sprite3D/SubViewport/ScoreLabel

func _ready():
	randomize()
	update_score_display()

func _on_ring_body_entered(body):
	$Player.game_over()
	
func add_score(points):
	score += points
	update_score_display()

func update_score_display():
	score_label.text = "Score: " + str(score)
	
