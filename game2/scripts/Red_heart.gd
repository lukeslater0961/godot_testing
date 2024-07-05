extends CharacterBody2D

const SPEED = 300.0
var moving := false

# Get the gravity from the project settings to be synced with RigidBody nodes.
var gravity = ProjectSettings.get_setting("physics/2d/default_gravity")

func _physics_process(_delta):
	# Get the input direction and handle the movement
	var direction_x = Input.get_axis("Move_left", "Move_right")
	var direction_y = Input.get_axis("Move_up", "Move_down")
	
	if direction_x:
		moving = true
		velocity.x = direction_x * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		moving = false
	
	if direction_y:
		moving = true
		velocity.y = direction_y * SPEED
	else:
		moving = false
	move_and_slide()

