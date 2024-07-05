extends Area2D

const Speed = 100
@onready var audio_stream_player_2d = $AudioStreamPlayer2D

func _ready():
	await get_tree().create_timer(2).timeout
	
func _process(delta):
	position.x -= (Speed * delta)
	if position.x <= -320 or (get_tree().current_scene and get_tree().current_scene.name != "Game"):
		queue_free()

func _on_body_entered(_body):
		audio_stream_player_2d.play()
		Globals.current_health -= 1
