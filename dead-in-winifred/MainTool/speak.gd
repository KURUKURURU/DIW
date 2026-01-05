extends Node2D
@export var name_label: String
@export var emotion: String

@onready var n = $name
@onready var s = $cropTool/Sprite

# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	
	#sets the given name as the name label
	n.text = name_label
	
	#sets the given character's sprite
	character_sprite()


func character_sprite():
	
	#Checks if the project
	if name_label == "Ava Bisset":
		if emotion == "neutral":
			s.texture = load("res://sprites by judas la carotte/sprite1 happy.png")
		if emotion == "sad":
			s.texture = load("res://sprites by judas la carotte/sprite1 sad.png")
		if emotion == "angry":
			s.texture = load("res://sprites by judas la carotte/sprite1 angry.png")
