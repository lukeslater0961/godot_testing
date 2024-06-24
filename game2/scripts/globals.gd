extends Node

var	prev_scene = null;
const bone = preload("res://scenes/bone.tscn")

func _show_node(node: Node2D): #to be used to make a node appear
	node.show()

func _hide_node(node: Node2D): #to be used to make a node disappear
	node.hide()

func _add_bone():#instantiates a moving bone onto the current scene
	var	bone_instance = bone.instantiate()
	add_child(bone_instance)
	bone_instance.position.y = 300


