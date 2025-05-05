extends CanvasLayer

@onready var fade = $FadeRect

func fade_out(duration: float = 1.0):
	visible = true
	var tween = get_tree().create_tween()
	tween.tween_property(fade, "modulate:a", 1.0, duration)
	await tween.finished

func fade_in(duration: float = 1.0):
	var tween = get_tree().create_tween()
	tween.tween_property(fade, "modulate:a", 0.0, duration)
	await tween.finished
	visible = false  # hides the whole fade layer
