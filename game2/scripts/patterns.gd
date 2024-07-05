extends Node

func starter():
	Globals._instantiate_object("res://scenes/bones/3_bones_ascending.tscn")
	await get_tree().create_timer(8).timeout
	Globals._instantiate_object("res://scenes/bones/3_bones_2_1.tscn")
	await get_tree().create_timer(3).timeout
	random_blue_bones()

func random_blue_bones():
	var i = 0
	while i < 8:
		var getrandom = randi_range(0, 1)
		print(getrandom)
		i += 1

