extends Node2D
 
var current_health = 20
var Max_health = 20
@onready var health_levels = $"labels/health levels"
@onready var red_heart = $Red_heart
@onready var audio_stream_player_2d = $AudioStreamPlayer2D

# Called when the node enters the scene tree for the first time.
func _ready():
	$fade_transition.show()
	$fade_transition/AnimationPlayer.play("fade_out")
	$fade_transition.hide()
	Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
	Setup()

func Setup():
	Globals.prev_scene = get_tree().current_scene.scene_file_path #sets current scene global var 
	health_levels.text = str(current_health)+ "/" + str(Max_health)
	await get_tree().create_timer(1.5).timeout #waits for 1.5 seconds
	Start()

func Start():
	Globals._show_node(red_heart)
	audio_stream_player_2d.play()

func _input(event):
	if event.is_action_pressed("options"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)		
		get_tree().change_scene_to_file("res://scenes/options.tscn")
	elif event.is_action_pressed("escape"):
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")
	elif event.is_action_pressed("full_quit"):
		get_tree().quit()
