extends Control

func _ready() -> void:
	Fader.fade_in(1.0)
	
func _on_button_pressed() -> void:
	await Fader.fade_out(2.0)
	get_tree().change_scene_to_file("res://scenes/ui/StartScreen.tscn")
