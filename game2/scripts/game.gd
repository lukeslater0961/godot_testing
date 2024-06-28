extends Node2D
 
@onready var audio_stream_player_2d = $AudioStreamPlayer2D
@onready var health_levels = $"labels/health levels"
@onready var red_heart = $Red_heart


func _input(event):
	if event.is_action_pressed("options"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		get_tree().change_scene_to_file("res://scenes/options.tscn")
	elif event.is_action_pressed("escape"):
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
	elif event.is_action_pressed("full_quit"):
		get_tree().quit()

func _ready():
	$fade_transition.show()
	$fade_transition/AnimationPlayer.play("fade_out")
	$fade_transition.hide()
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	Setup()

func Setup():
	Globals.current_health = 20	
	Globals.prev_scene = get_tree().current_scene.scene_file_path #sets current scene global var 
	health_levels.text = str(Globals.current_health)+ "/" + str(Globals.Max_health)
	await get_tree().create_timer(1.5).timeout #waits for 1.5 seconds
	Start()

func Start():
	Globals._show_node(red_heart, 574, 360)
	audio_stream_player_2d.play()
	game_patterns()

func game_patterns():#loads the patterns
	Globals._instantiate_object("res://scenes/bones/3_bones_ascending.tscn")
	await get_tree().create_timer(8).timeout
	Globals._instantiate_object("res://scenes/bones/3_bones_2_1.tscn")

func _process(_delta): # updates the health
	health_levels.text = str(Globals.current_health) + "/" + str(Globals.Max_health)
