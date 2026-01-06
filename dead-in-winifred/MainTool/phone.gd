extends Node2D

@onready var a = $Movement
@onready var ring = $whole/Caller/CallingScreen/PhoneRing
@onready var calling_s = $whole/Caller/CallingScreen
@onready var calling_n = $whole/Caller/CallingScreen/name
@onready var calling_timer = $"whole/Caller/CallingScreen/0_00"

var up: bool = false
var has_access: bool = true
var on_call: bool = false

signal phone_pickup
signal accept

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	calling_s.hide()
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

func _phone_ringing(person: String):
	
	calling_n.text = person
	calling_s.show()
	
	ring.play()
	await phone_pickup
	
	ring.stop()
	calling_timer.show()
	calling_timer.start()
	


func accepted() -> void:
	
	if calling_s.visible:
		emit_signal("phone_pickup")
		on_call = true
		
		return
	
	emit_signal("accept")
