extends RichTextLabel
var loop = 60
var num = 0

func start():
	text = "0:00"
	
	for i in loop:
		
		num += 1
		
		await wait(1.0)
		if num < 10:
			text = "0:0" + str(num)
		else:
			text = "0:" + str(num)
		

func wait(seconds: float) -> void:
	await get_tree().create_timer(seconds).timeout
