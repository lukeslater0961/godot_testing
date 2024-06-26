extends Area2D

const Speed = 100
@onready var audio_stream_player_2d = $AudioStreamPlayer2D

func _ready():
	await get_tree().create_timer(2).timeout
	
func _process(delta):
	position.x -= (Speed * delta)
	if position.x <= -342 or get_tree().get_current_scene().get_name() != "Game":
		queue_free()

func _on_body_entered(body):
	if body.name == "Red_heart":
		audio_stream_player_2d.play()
		Globals.current_health -= 1

