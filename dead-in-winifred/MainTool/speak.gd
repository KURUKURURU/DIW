extends Node2D
@export var name_label: String
@export var emotion: String

@onready var n = $name
@onready var s = $cropTool/Sprite
@onready var t = $txt
@onready var a = $animation
@onready var ab = $advance_button

signal go

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	self.hide() # Hide textbox on start.
	ab.hide() # Hide advance on start.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	#sets the given name as the name label
	n.text = name_label
	
	#sets the given character's sprite
	character_sprite()

#sprite/texture linking:
func character_sprite():
	
	#Checks if the project
	if name_label == "Ava Bisset":
		if emotion == "neutral":
			s.texture = load("res://sprites by judas la carotte/sprite1 happy.png")
		if emotion == "sad":
			s.texture = load("res://sprites by judas la carotte/sprite1 sad.png")
		if emotion == "angry":
			s.texture = load("res://sprites by judas la carotte/sprite1 angry.png")
#


#important speaking process:
func say(message):
	
	#initalize and check a few things to ensure smoothness
	t.text = message 
	t.visible_ratio = 0
	ab.hide()
	
	a.play("reveal")
	self.show()
	
	await a.animation_finished
	await wait(1.0)
	
	ab.show()
	await go 
	
	self.hide()
	t.text = "" 
	t.visible_ratio = 0
	
	return
#


func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout


func advance() -> void:
	emit_signal("go")
