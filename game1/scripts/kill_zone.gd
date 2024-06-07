extends Area2D

@onready var timer = $Timer

func _on_body_entered(body):
	print("you died")
	Engine.time_scale = 0.5#slows down overwall game time
	body.get_node(("CollisionShape2D")).queue_free()#removes de collider of the player
	timer.start()
#triggers the killzone 

func _on_timer_timeout():
	Engine.time_scale = 1
	get_tree().reload_current_scene()
# restarts the scene
