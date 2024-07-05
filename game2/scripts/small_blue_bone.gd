extends Area2D

# Reference to the player node
var player
var Speed := 100

func _on_body_entered(body):
	check_damage(body)

func check_damage(body):#removes health if character is moving when in contact
	if Globals.player_moving:
		Globals.current_health -= 1

func _process(delta):#makes bone move in the right direction
	position.x -= (Speed * delta)
	if position.x <= -342 or (get_tree().current_scene and get_tree().current_scene.name != "Game"):
		queue_free()
