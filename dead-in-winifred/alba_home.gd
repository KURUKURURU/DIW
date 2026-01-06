extends Node2D
@onready var player = $Player
@onready var car = $Car
@onready var car_animation = $Car/Driving
@onready var fade = $Fade/fade

var drove_in: bool =  false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	player.can_move = false
	player.hide()
	
	car_animation.play("Drive_in")
	
	fade.play("fade_start")
	await car_animation.animation_finished
	player.show()
	
	drove_in = true
	player.can_move = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if drove_in:
		car.position = Vector2(1125.0, 238.0)
