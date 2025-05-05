extends Control

# ───────────────────────────────────────────────
# start screen with audio + sprite flare before game begins
# fades in on load and fades out before starting cutscene
# ───────────────────────────────────────────────

@onready var sprite = $Sprite2D
@onready var audio = $gunshot

# fade in from black on scene load
func _ready():
	Fader.fade_in(1.0)
	sprite.visible = false


# listen for play input to start game sequence
func _input(event):
	if event.is_action_pressed("Play"):
		audio.play()
		await get_tree().create_timer(0.2).timeout
		sprite.visible = true
		await get_tree().create_timer(1.4).timeout
		await Fader.fade_out(2.0)
		get_tree().change_scene_to_file("res://scenes/ui/Cutscene.tscn")
