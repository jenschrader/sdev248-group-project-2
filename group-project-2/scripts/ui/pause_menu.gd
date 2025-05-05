extends CanvasLayer

# ───────────────────────────────────────────────
# pause menu overlay (canvas layer)
# toggles pause on esc / ui_cancel and disables input/gameplay
# includes resume button handler
# ───────────────────────────────────────────────


# listen for esc to toggle pause menu
func _input(event):
	if event.is_action_pressed("ui_cancel"):
		toggle_pause()

# toggles visibility and pauses/unpauses the scene tree
func toggle_pause():
	visible = not visible
	get_tree().paused = visible
	
	process_mode = Node.PROCESS_MODE_ALWAYS # input is still processed when paused


# resumes game manually (for resume button)
func resume():
	visible = false
	get_tree().paused = false


# connected to resume button's pressed signal
func _on_resume_pressed() -> void:
	resume()
