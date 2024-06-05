extends Node

@onready var score_label = $Score_label
var score = 0


func add_point():
	score += 1
	score_label.text = "Your score is " + str(score)
	print(score)
#changes score label to the current score
