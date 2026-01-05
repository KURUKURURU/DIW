extends CharacterBody2D


const SPEED = 300.0
var moving : bool

func _physics_process(delta: float) -> void:
	
	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var direction := Input.get_vector("left", "right", "up", "down")
	
	if velocity.x != 0 or velocity.x != 0:
		moving = true
	else:
		moving = false
	
	if Input.is_action_pressed("right") || Input.is_action_pressed("left"):
		direction.y = 0
	elif Input.is_action_pressed("up") || Input.is_action_pressed("down"):
		direction.x = 0
	else:
		direction = Vector2.ZERO
		
	
	direction = direction.normalized()
	velocity = direction * SPEED
	move_and_slide()
