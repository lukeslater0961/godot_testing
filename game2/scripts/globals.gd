extends Node

var	prev_scene = null;

func _show_node(node: Node2D): #to be used to make a node appear
	node.show()

func _hide_node(node: Node2D): #to be used to make a node disappear
	node.hide()
