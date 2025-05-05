extends Control

# ───────────────────────────────────────────────
# level complete screen
# handles fade-in on show and fade-out to restart
# ───────────────────────────────────────────────

func _ready() -> void:
	Fader.fade_in(1.0) # fade in when level complete screen appears


func _on_button_pressed() -> void:
	await Fader.fade_out(2.0) # fade out before returning to start screen
	get_tree().change_scene_to_file("res://scenes/ui/StartScreen.tscn")
