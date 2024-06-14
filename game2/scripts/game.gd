extends Node2D
@onready var area_2d_2 = $Area2D2
const TEXT_BOX_2 = preload("res://assets/Sprites/dialog_boxes/text_box2.png")

# Called when the node enters the scene tree for the first time.
func _ready():
	$fade_transition.show()
	$fade_transition/AnimationPlayer.play("fade_out")
	$fade_transition.hide()
	Globals.prev_scene = get_tree().current_scene.scene_file_path #sets current scene global var 
	await get_tree().create_timer(1.5).timeout #waits for 1.5 seconds
	$Area2D2/Sprite2D.set_texture(TEXT_BOX_2)


func _input(event):
	if event.is_action_pressed("escape"):
		get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func _on_options_pressed():
	get_tree().change_scene_to_file("res://scenes/options.tscn")
