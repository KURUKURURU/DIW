extends CharacterBody2D

const MAX_SPEED = 250.0
const ACCELERATION = 1200.0
const FRICTION = 500.0

func _physics_process(delta):
	var direction_x = Input.get_axis("left", "right")

	if direction_x != 0:
		# Accelerate toward target speed
		velocity.x = move_toward(
			velocity.x,
			direction_x * MAX_SPEED,
			ACCELERATION * delta
		)
	else:
		# Smoothly slow down instead of stopping
		velocity.x = move_toward(
			velocity.x,
			0,
			FRICTION * delta
		)

	velocity.y = 0
	move_and_slide()
