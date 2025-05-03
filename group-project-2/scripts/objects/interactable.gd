extends Area2D

@export var message: String = ""
@export var has_gun: bool = false
@export var object_id: String = ""


func _ready():
	if object_id != "":
		GameManager.register_required_object(object_id)

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
		get_tree().change_scene_to_file("res://scenes/ui/LevelComplete.tscn")
	else:
		get_tree().call_group("dialogue", "show_message", message)
	print("Interacted with: ", self.name)

func _on_body_entered(body):
	if body.name == "Player":
		body.set_interactable(self)

func _on_body_exited(body):
	if body.name == "Player":
		body.clear_interactable()
