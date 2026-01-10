extends Node2D
@onready var car = $Car
@onready var fade = $Fade/fade

var drove_in: bool =  false

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	car.can_move = false
	fade.play("fade_start")
	await fade.animation_finished
	car.can_move = true


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	if car.position >= Vector2(800.0, car.position.y):
		print("debug")
		
		get_tree().change_scene_to_file("res://MainTool/alba_home.tscn")
		
