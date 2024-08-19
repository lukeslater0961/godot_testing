extends Node2D
@onready var line_edit = $Input/LineEdit
@onready var load_button = $Input/Load_button
@onready var error_sound = $Error_sound
var default_score = 0

func _on_load_pressed():#gets user input and calls loading function
	var user_input = line_edit.text
	if user_input == "":
		return
	_check_user(user_input)

func _input(event):#gets user input and calls loading function (on enter pressed)
	if event.is_action_pressed("Enter"):
		var user_input = line_edit.text
		if user_input == "":
			return
		_check_user(user_input)

func _check_user(user_input):#loads (if file exists) the data of the given file/user
	var filename = "user://%s.txt" % user_input
	if FileAccess.file_exists(filename) == false:
		_create_user_file(user_input, filename)
	else:
		var file = FileAccess.open(filename, FileAccess.READ)
		Globals.High_score = file.get_var()
		Globals.current_user = user_input
		Globals._hide_node(self)
		print("loaded existing profile")

func _create_user_file(user_input, filename):#loads current data into the given file/user
	if not Globals.has_special_characters(user_input):
		var file = FileAccess.open(filename, FileAccess.WRITE)
		file.store_var(default_score)
		Globals.current_user = user_input
		Globals._hide_node(self)
		print("default profile created")
	else:
		error_sound.play()
		line_edit.placeholder_text = "invalid name"
		line_edit.text = ""
