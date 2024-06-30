extends Sprite2D
@onready var line_edit = $Input/LineEdit
@onready var load = $Input/Load
var user_input = null

func _on_load_pressed():
	user_input = line_edit.text
	_check_user(user_input)

func _on_texture_button_pressed():
	get_tree().change_scene_to_file("res://scenes/main_menu.tscn")

func _check_user(user_input):
	var filename = "res://user/%s.txt" % user_input
	var file = FileAccess.open(filename, FileAccess.READ_WRITE)
	if FileAccess.file_exists(filename) == false:
		file = FileAccess.open(filename, FileAccess.WRITE)
	
