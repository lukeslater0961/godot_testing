extends Node2D

func	_on_quit_pressed():
	get_tree().change_scene_to_file(Globals.prev_scene)

func	_input(event):
	if event.is_action_pressed("escape"):
		get_tree().change_scene_to_file(Globals.prev_scene)
