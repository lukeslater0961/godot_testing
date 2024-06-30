extends Node

var	prev_scene = null;
var current_health = 20
var Max_health = 20
var High_score = 0

func _show_node(node: Node2D, x: float , y: float): #to be used to make a node appear
	node.show()
	node.position = Vector2(x, y)

func _hide_node(node: Node2D): #to be used to make a node disappear
	node.hide()

func _instantiate_object(string):
	var object = load(string)
	var	object_instance = object.instantiate()
	object_instance.position.y = 450
	object_instance.position.x = 750
	add_child(object_instance)
