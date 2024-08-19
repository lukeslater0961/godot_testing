extends CharacterBody2D

const SPEED = 300.0

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(_delta):
	# Get the input direction and handle the movement
	var direction_x = Input.get_axis("Move_left", "Move_right")
	var direction_y = Input.get_axis("Move_up", "Move_down")
	
	if direction_x:
		Globals.player_moving = true
		velocity.x = direction_x * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		Globals.player_moving = false
	
	if direction_y:
		Globals.player_moving = true
		velocity.y = direction_y * SPEED
	else:
		Globals.player_moving = false
	move_and_slide()
