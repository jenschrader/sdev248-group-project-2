extends Control

@onready var sprite = $Sprite2D
@onready var audio = $gunshot
@onready var fade = $FadeRect

func _ready():
	sprite.visible = false


func _input(event):
	if event.is_action_pressed("Play"):
		audio.play()
		await get_tree().create_timer(0.2).timeout
		sprite.visible = true
		await get_tree().create_timer(1.4).timeout
		await fade_to_black()
		get_tree().change_scene_to_file("res://scenes/ui/Cutscene.tscn")

func fade_to_black():
	var tween = get_tree().create_tween()
	tween.tween_property(fade, "modulate:a", 2.0, 2.0) # fade over 1 second
	await tween.finished
