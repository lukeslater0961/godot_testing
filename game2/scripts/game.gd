extends Node2D


# Called when the node enters the scene tree for the first time.
func _ready():
	$fade_transition.show()
	$fade_transition/AnimationPlayer.play("fade_out")
	$fade_transition.hide()

func _input(event):
	if event.is_action_pressed("escape"):
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
