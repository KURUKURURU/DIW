extends CharacterBody2D

const MAX_SPEED = 240.0
const ACCELERATION = 1000.0
const FRICTION = 700.0

var ai_direction := 0
var decision_timer := 0.0

func _ready():
	pick_new_direction()

func _physics_process(delta):
	decision_timer -= delta
	if decision_timer <= 0:
		pick_new_direction()

	if ai_direction != 0:
		velocity.x = move_toward(
			velocity.x,
			ai_direction * MAX_SPEED,
			ACCELERATION * delta
		)
	else:
		velocity.x = move_toward(
			velocity.x,
			0,
			FRICTION * delta
		)

	velocity.y = 0
	move_and_slide()

func pick_new_direction():
	var roll = randf() # ya get random float
	if roll < 0.7:
		ai_direction = -1
	elif roll < 0.85:
		ai_direction = 0.7

	decision_timer = randf_range(1.0, 3.0)
