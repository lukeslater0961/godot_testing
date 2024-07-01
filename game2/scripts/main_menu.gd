extends Node2D

var	button_type = null;
@onready var high_score = $labels/High_score
@onready var load_save = $load_save
@onready var menu_music = $"Menu music"

func _ready():#on scene load sets prev scene , hides mouse and shows the high_score
	Globals.prev_scene = get_tree().current_scene.scene_file_path
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	Globals._hide_node(load_save)
	high_score.text = "High score = " + str("%.1f" % Globals.High_score) + " s"

func _process(delta):#refreshes high score if file is loaded
	high_score.text = "High score = " + str("%.1f" % Globals.High_score) + " s"

func _input(event):#gets input to close game if escape is pressed
	if event.is_action_pressed("escape") and not load_save.is_visible_in_tree() :
		get_tree().quit()

func _on_quit_pressed():#closes game
	get_tree().quit()
	
func _on_start_pressed():#starts fade animation
	button_type = "Start"
	$fade_transition.show()
	$fade_transition/Fade_timer.start()
	$fade_transition/AnimationPlayer.play("fade_in")

func _on_fade_timer_timeout():#opens game scene once animation timer does a timeout
	if button_type == "Start" :
		get_tree().change_scene_to_file("res://scenes/game.tscn")

func _on_settings_pressed():#open's Settings scene
		get_tree().change_scene_to_file("res://scenes/options.tscn")

func _on_how_to_pressed():#open's how to scene
	get_tree().change_scene_to_file("res://scenes/How_To_Play.tscn")

func _on_load_pressed(): #shows the user loader window
	Globals._show_node(load_save, load_save.position.x, load_save.position.y)
	menu_music.stop()

