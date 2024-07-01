extends Node2D
@onready var line_edit = $Input/LineEdit
@onready var load_button = $Input/Load_button
@onready var error_sound = $Error_sound

func _on_texture_button_pressed():#hide's/closes the window and resets the properties
	line_edit.text = ""
	line_edit.add_theme_color_override("font_placeholder_color", Color(0.5, 0.5, 0.5))
	line_edit.placeholder_text = str("Name")
	Globals._hide_node(self)

func _on_load_pressed():#gets user input and calls loading function
	var user_input = line_edit.text
	if user_input == "":
		return
	_check_user(user_input)

func _on_save_button_pressed():#gets user input and calls saving function
	var user_input = line_edit.text
	if user_input == "":
		return
	_save_game(user_input)

func _check_user(user_input):#loads (if file exists) the data of the given file/user
	var filename = "user://%s.txt" % user_input
	if FileAccess.file_exists(filename) == false:
		line_edit.add_theme_color_override("font_placeholder_color", Color(1, 0, 0))
		line_edit.placeholder_text = str("Invalid filename")
		line_edit.text = ""
		error_sound.play()
	else:
		var file = FileAccess.open(filename, FileAccess.READ)
		Globals.High_score = file.get_var()
		print("data loaded")

func _save_game(user_input):#loads current data into the given file/user
	var filename = "user://%s.txt" % user_input
	var file = FileAccess.open(filename, FileAccess.WRITE)
	file.store_var(Globals.High_score)
	print("saved")

