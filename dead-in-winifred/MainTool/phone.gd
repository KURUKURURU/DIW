extends Node2D

@onready var a = $Movement

var up: bool = false
var has_access: bool = true

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	#self.hide()
	a.play("RESET")
	


# Called every frame. 'delta' is the elapsed time since the previous frame.

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("phone"):
		print("issue_detect")
		
		if up:
			a.play("Away")
			up = false
		elif not up and has_access:
			a.play("PullUp")
			up = true
