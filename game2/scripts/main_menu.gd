extends Node2D

var	button_type = null;

func _ready():
	Globals.prev_scene = get_tree().current_scene.scene_file_path
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)

func _input(event):
	if event.is_action_pressed("escape") :
		get_tree().quit()
		
func _on_start_pressed():
	button_type = "Start"
	$fade_transition.show()
	$fade_transition/Fade_timer.start()
	$fade_transition/AnimationPlayer.play("fade_in")
	
func _on_settings_pressed():
		get_tree().change_scene_to_file("res://scenes/options.tscn")
		

func _on_quit_pressed():
	get_tree().quit()

func _on_how_to_pressed():
	get_tree().change_scene_to_file("res://How_To_Play.tscn")

func _on_fade_timer_timeout():
	if button_type == "Start" :
		get_tree().change_scene_to_file("res://scenes/game.tscn")


