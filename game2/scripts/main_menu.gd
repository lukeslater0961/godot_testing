extends Node2D

var	button_type = null;
@onready var high_score = $labels/High_score
@onready var load_save = $load_save
@onready var menu_music = $"Menu music"
@onready var labels = $labels
@onready var button_manager = $Button_manager

func _ready():#on scene load sets prev scene , hides mouse and shows the high_score
	Globals.prev_scene = get_tree().current_scene.scene_file_path
	Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	if Globals.High_score != 0:
		high_score.text = "High score = " + str("%f" % Globals.High_score) + " s"
	if Globals.current_user == "":
		Globals._show_node(load_save, 0, 0)
		Globals._hide_node(labels)
	else :
		menu_music.play()

func _process(delta):#refreshes high score if file is loaded
	if Globals.High_score != 0:
		high_score.text = Globals.current_user + "'s High score = " + str("%.1f" % Globals.High_score) + " s"
	if Globals.current_user:
		Globals._show_node(labels, labels.position.x, labels.position.y)
		

func _input(event):#gets input to close game if escape is pressed
	if event.is_action_pressed("escape") :
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

func _on_save_pressed():
	var filename = "user://%s.txt" % Globals.current_user
	var file = FileAccess.open(filename, FileAccess.WRITE)
	file.store_var(Globals.High_score)
	print("saved to profile")
