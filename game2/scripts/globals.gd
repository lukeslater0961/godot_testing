extends Node

var	prev_scene = null;
var current_health = 20
var Max_health = 20
var High_score = 0
var current_user = ""
var player_moving = false

func _show_node(node: Node2D, x: float , y: float): #to be used to make a node appear
	node.show()
	node.position = Vector2(x, y)

func _hide_node(node: Node2D): #to be used to make a node disappear
	node.hide()

func _instantiate_object(string, side):#to instantiate an object
	var object = load(string)
	var	object_instance = object.instantiate()
	if string == "res://scenes/bones/big_blue_bone.tscn":
		if side:
			object_instance.position.y = 300
		else:
			object_instance.position.y = 410
		object_instance.position.x = 750
	else:
		if side:
			object_instance.position.y = 300
		else:
			object_instance.position.y = 445
		object_instance.position.x = 750
	add_child(object_instance)

func has_special_characters(string):#checks for special characters in username input
	var regex = RegEx.new()
	regex.compile("[^a-zA-Z0-9]+")
	if regex.search(str(string)):
		return true
	else:
		return false
