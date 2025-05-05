extends CanvasLayer

func _input(event):
	if event.is_action_pressed("ui_cancel"):
		toggle_pause()

func toggle_pause():
	visible = not visible
	get_tree().paused = visible


	process_mode = Node.PROCESS_MODE_ALWAYS

func resume():
	visible = false
	get_tree().paused = false


func _on_resume_pressed() -> void:
	resume()
