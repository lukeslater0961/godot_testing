extends Node
var current_count = 0
var previous_number = null

func starter():
	Globals._instantiate_object("res://scenes/bones/3_bones_ascending.tscn", 0)
	await get_tree().create_timer(8).timeout
	Globals._instantiate_object("res://scenes/bones/3_bones_2_1.tscn", 0)
	await get_tree().create_timer(3).timeout
	random_blue_bones()

func random_blue_bones():
	for i in range(8):
		randomize()
		var random_number = randi_range(0, 1)  # Generates either 0 or 1
		random_number = check_reccurences(random_number)
		Globals._instantiate_object("res://scenes/bones/big_blue_bone.tscn", random_number)
		await get_tree().create_timer(0.35).timeout

func check_reccurences(random_number): #checks for reccurences inside the randomizer
	if random_number == previous_number:
		current_count += 1
	else:
		current_count = 0  # Reset count if the number changes
	if current_count == 2:
		if random_number == 1:
			random_number = 0
		elif random_number == 0:
			random_number = 1
		current_count = 0
	previous_number = random_number
	return (random_number)
