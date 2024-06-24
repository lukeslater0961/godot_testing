extends Area2D

const Speed = 180

func _ready():
	await get_tree().create_timer(1.5).timeout
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	position.x += (Speed * delta)
	if (position.x == 688):
		queue_free()
