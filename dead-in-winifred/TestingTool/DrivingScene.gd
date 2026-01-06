extends Node2D

## ---------------------------------------------------------------------------##

#Copy and paste the following code into other important scenes to reduce coding time:

#@onready var e = $Player/RemoteTransform2D/Emote  #emotes / screen animations
@onready var speak = $Car/GUI/Speak #textbox text, name, and sprite

@onready var em = speak.emotion  #textbox text, name, and sprite

#@onready var player = $Player #body
@onready var phone = $Car/GUI/phone

#@onready var player_body = $Player/area #body
#@onready var ava = $AVA/area #me lol

var can_interact: bool  = true

signal release

# Called when the node enters the scene tree for the first time.

func say( message: String ):
	await check_phone()
	await speak.say(message)

#func stop():
	#player.can_move = false
	#can_interact = false
	#await release
	#player.can_move = true
	#can_interact = true

func done():
	emit_signal("release")
	phone.has_access = true
	
func check_phone():
	if phone.up:
		phone.a.play("Away")
		phone.up = false
		await phone.a.animation_finished
	
	phone.has_access = false

## ---------------------------------------------------------------------------##



# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	await wait(5.0)
	await phone._phone_ringing("Will Andrews")
	
	#stop()
	
	print("sprite change!")
	speak.name_label = "Will"
	speak.emotion = "happy"
	
	await say("Heya!")
	await say("Are you driving?")
	
	print("sprite change!")
	speak.name_label = "Alba"
	speak.emotion = "happy"
	
	await say("Yup. But don't worry, I'm focusing on the road.")
	await say("What'd you need?")
	
	print("sprite change!")
	speak.name_label = "Will"
	speak.emotion = "happy"
	await say("Well, first, I'd like to ask how the moving is going.")
	
	print("sprite change!")
	speak.name_label = "Alba"
	speak.emotion = "happy"
	await say("It's fine. Though I think it's a bit much for one person.")
	await say("I had to hire 2 trucks.")
	
	print("sprite change!")
	speak.name_label = "Will"
	speak.emotion = "happy"
	await say("Jeez Alba! You're one person! How can you have that much crap?!")
	await say("I thought you were trying to go small?!")
	
	print("sprite change!")
	speak.name_label = "Alba"
	speak.emotion = "happy"
	await say("If you're about to be my boss, I don't think you should at so unflappable.")
	
	print("sprite change!")
	speak.name_label = "Will"
	speak.emotion = "happy"
	await say("You asked for the job, I can talk [i]however I like[/i].")
	await say("...'unflappable?'")
	
	await wait(1.0) #pause
	
	print("sprite change!")
	speak.name_label = "Will"
	speak.emotion = "happy"
	await say("Well, I actually called to warn you.")
	await say("We just got a new case, and you'll have to prepare yourself, because it's quite...")
	await say("Mm.")
	await say("Let's just say we haven't had this many connected cases in a while.")
	
	print("sprite change!")
	speak.name_label = "Alba"
	speak.emotion = "happy"
	await say("Serial killings?")
	
	print("sprite change!")
	speak.name_label = "Will"
	speak.emotion = "happy"
	await say("Yup. I'll talk to you more about it when you come by later.")
	await say("For now just focus on yourself and settling in.")
	
	print("sprite change!")
	speak.name_label = "Alba"
	speak.emotion = "happy"
	await say("Thanks.")
	await say("Bye Boss.")
	
	done()
	
func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout
