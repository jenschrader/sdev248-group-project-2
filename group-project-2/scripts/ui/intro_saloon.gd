extends Node2D

# ───────────────────────────────────────────────
# level entry script
# fades in the screen when the level loads
# ───────────────────────────────────────────────

func _ready():
	Fader.fade_in(1.0)
