extends Area2D

@onready var game_manager = %GameManager
@onready var pickup_animation = $PickupAnimation

func _on_body_entered(body):
	game_manager.add_point()
	pickup_animation.play("pickup")
