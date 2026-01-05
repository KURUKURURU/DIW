extends TextureButton
signal advance

func _on_pressed() -> void:
	emit_signal("advance")

func _process(delta: float) -> void:
	if Input.is_action_just_pressed("ui_accept") and self.visible:
		emit_signal("advance")
