extends CharacterBody2D

@export var sprite: String
@export var CHOICE: float
@export var SPEED: float

@onready var img = $Sprite2D
@onready var front_ray = $detect

var MAX_SPEED = 100  # default 100
const ACCELERATION = 1000.0
const FRICTION = 700.0

var target_speed = 0
var ai_direction := 0
var decision_timer := 0.0

func _process(delta: float) -> void:
	MAX_SPEED = SPEED
	target_speed = MAX_SPEED
	img.texture = load(sprite)

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
	
	if front_ray.is_colliding():
		target_speed = 0 # or slow down instead of full stop

	velocity.x = move_toward(
		velocity.x,
		ai_direction * target_speed, 
		ACCELERATION * delta)
	
	velocity.y = 0
	move_and_slide()

func pick_new_direction():
	var roll = randf() # ya get random float
	if roll < 0.7:
		ai_direction = 1
	elif roll < 0.85:
		ai_direction = CHOICE #-1 if not the leader, 0 if it is.

	decision_timer = randf_range(1.0, 2.0)
