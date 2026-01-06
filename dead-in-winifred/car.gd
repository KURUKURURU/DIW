extends CharacterBody2D

@onready var car_hum = $carhum

const MAX_SPEED = 250.0
const ACCELERATION = 1200.0
const FRICTION = 500.0

var moving: bool

func _process(delta: float) -> void:
	if moving == true:
		if not car_hum.playing:
			car_hum.play()
	else:
		if car_hum.playing:
			car_hum.stop()

func _physics_process(delta):
	var direction_x = Input.get_axis("left", "right")

	if direction_x != 0:
		moving = true
		# Accelerate toward target speed
		velocity.x = move_toward(
			velocity.x,
			direction_x * MAX_SPEED,
			ACCELERATION * delta
		)
	else:
		moving = false
		
		# Smoothly slow down instead of stopping
		velocity.x = move_toward(
			velocity.x,
			0,
			FRICTION * delta
		)

	velocity.y = 0
	move_and_slide()
