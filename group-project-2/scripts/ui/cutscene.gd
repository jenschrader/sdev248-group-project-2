extends Control

@onready var label = $ColorRect/StoryLabel
@onready var continue_button = $ColorRect/ContinueButton
@onready var type_sfx = $TypeSFX
@onready var fast_forward_icon = $FastForwardIcon  

var story_text := """In 1885 Phoebe Ann Moses, her friends call her Annie, left Cincinnati, Ohio by rail with her husband, Frank Butler.\nShe was headed westward to join Buffalo Bill’s Wild West. She and her husband were staying on a railcar from the Houston & Texas Central Railroad.\nAnnie had always played second billing to her husband, but when she joined Buffalo Bill, she had first billing. Come see “Champion Markswoman” at Buffalo Bill’s Wild West.\nShe returned to her railcar to see that her .22 caliber gun was missing.\nHelp Annie find her missing gun and brave the dangers on the open prairie.\nWill she find her missing gun in time for the big show?"""

func _ready():
	Fader.fade_in(1.0)
	label.text = ""
	continue_button.visible = false
	fast_forward_icon.visible = false
	typewriter_effect()

func typewriter_effect():
	for i in story_text.length():
		var char = story_text.substr(i, 1)
		label.text += char

		if char != " " and char != "\n":
			if type_sfx:
				type_sfx.pitch_scale = randf_range(0.7, 1.0)
				type_sfx.play()

		var delay := 0.08

		if char == "\n":
			delay = 0.5
		elif char == " ":
			delay = 0.05

		if Input.is_action_pressed("speed_up"):
			delay *= 0.3
			fast_forward_icon.visible = true
		else:
			fast_forward_icon.visible = false

		await get_tree().create_timer(delay).timeout

	await get_tree().create_timer(0.3).timeout
	continue_button.visible = true
	fast_forward_icon.visible = false  # just in case it's still visible

func _on_continue_button_pressed() -> void:
	await Fader.fade_out(2.0)
	get_tree().change_scene_to_file("res://scenes/levels/IntroSaloon.tscn")
