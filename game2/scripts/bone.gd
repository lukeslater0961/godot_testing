extends Area2D

const Speed = 100

func _ready():
	await get_tree().create_timer(1.5).timeout
	
func _process(delta):
	position.x += (Speed * delta)
	if position.x >= 688:
		queue_free()
