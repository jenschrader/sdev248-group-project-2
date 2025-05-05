extends CanvasLayer

# ───────────────────────────────────────────────
# fade layer for screen transitions (autoload)
# uses a fullscreen colorrect to fade in/out between scenes
# ───────────────────────────────────────────────

@onready var fade = $FadeRect # reference to the black overlay

# fades screen to black over [duration; 1 sec here] seconds
func fade_out(duration: float = 1.0):
	visible = true
	var tween = get_tree().create_tween()
	tween.tween_property(fade, "modulate:a", 1.0, duration)
	await tween.finished


# fades screen back in over [duration; 1 sec here] seconds (to transparent)
func fade_in(duration: float = 1.0):
	var tween = get_tree().create_tween()
	tween.tween_property(fade, "modulate:a", 0.0, duration)
	await tween.finished
	visible = false  # hides the whole fade layer
