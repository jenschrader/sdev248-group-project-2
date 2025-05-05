extends Area2D

# ───────────────────────────────────────────────
# interactable object (e.g. barrels, railcars)
# handles dialogue, state tracking, and win condition logic
# ───────────────────────────────────────────────

@export var message: String = ""
@export var has_gun: bool = false
@export var object_id: String = ""

# registers this object with the game manager if it has an id
func _ready():
	if object_id != "":
		GameManager.register_required_object(object_id)


# handles player interaction
func interact():
	if object_id != "":
		GameManager.mark_checked(object_id)
		
	if has_gun:
		GameManager.has_gun = true
		get_tree().call_group("dialogue", "show_message", "There it is! My gun!")
	
		var player = get_tree().get_first_node_in_group("player")
		if player:
			player.set_gun_visible()
			
		await get_tree().create_timer(2).timeout

		get_tree().call_group("dialogue", "show_message", "Now I better hurry to the show!")
		
		await get_tree().create_timer(2).timeout
		await Fader.fade_out(2.0)
		get_tree().change_scene_to_file("res://scenes/ui/LevelComplete.tscn")
	else:
		get_tree().call_group("dialogue", "show_message", message)
		
	print("nteracted with: ", self.name) # debug; optional


# enables interaction when player enters
func _on_body_entered(body):
	if body.name == "Player":
		body.set_interactable(self)


# disables interaction when player exits
func _on_body_exited(body):
	if body.name == "Player":
		body.clear_interactable()
