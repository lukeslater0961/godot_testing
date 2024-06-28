extends Node2D

func _on_master_volume_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), value)

func _on_music_volume_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Music"), value)

func _on_sfx_volume_value_changed(value):
	AudioServer.set_bus_volume_db(AudioServer.get_bus_index("SFX"), value)

func _on_quit_pressed():
	get_tree().change_scene_to_file(Globals.prev_scene);

func _input(event):
	if event.is_action_pressed("escape"):
		get_tree().change_scene_to_file(Globals.prev_scene)
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)






