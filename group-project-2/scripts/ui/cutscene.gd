extends Control

@onready var label = $ColorRect/StoryLabel
@onready var continue_button = $ColorRect/ContinueButton

var story_text := """In 1885 Phoebe Ann Moses, her friends call her Annie, left Cincinnati, Ohio by rail with her husband, Frank Butler.\nShe was headed westward to join Buffalo Bill’s Wild West. She and her husband were staying on a railcar from the Houston & Texas Central Railroad.\nAnnie had always played second billing to her husband, but when she joined Buffalo Bill, she had first billing. Come see “Champion Markswoman” at Buffalo Bill’s Wild West.\nShe returned to her railcar to see that her .22 caliber gun was missing.\nHelp Annie find her missing gun and brave the dangers on the open prairie.\nWill she find her missing gun in time for the big show?"""

func _ready():
	label.text = ""
	continue_button.visible = false
	typewriter_effect()

func typewriter_effect():
	for i in story_text.length():
		label.text += story_text[i]
		await get_tree().create_timer(0.035).timeout
	await get_tree().create_timer(0.3).timeout
	continue_button.visible = true

func _on_continue_button_pressed() -> void:
	get_tree().change_scene_to_file("res://scenes/levels/IntroSaloon.tscn")
