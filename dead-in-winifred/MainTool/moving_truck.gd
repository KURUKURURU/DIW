extends CharacterBody2D

@export var sprite: String
@export var SPEED: float

@onready var img = $Sprite2D
@onready var front_ray = $detect
@onready var honk = $honk

var MAX_SPEED = 100  # default 100
const ACCELERATION = 1000.0
const FRICTION = 300.0

var target_speed = 200
var direction := -1
var still_time = 0

func _process(delta: float) -> void:
	MAX_SPEED = SPEED
	target_speed = MAX_SPEED
	img.texture = load(sprite)
	
	if still_time > 5:
		#print("debug")
		if not honk.playing:
			honk.play()
	else:
		if honk.playing:
			honk.stop()
	
	while not Input.is_action_pressed("left"):
		await wait(1.0)
		still_time += 1
		
	if Input.is_action_pressed("left"): 
		still_time = 0
		

func _physics_process(delta):
	
	if front_ray.is_colliding():
		target_speed = 0 # or slow down instead of full stop
	
	velocity.x = move_toward(
		velocity.x,
		direction * target_speed, 
		ACCELERATION * delta)
	
	velocity.y = 0
	move_and_slide()

func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout
