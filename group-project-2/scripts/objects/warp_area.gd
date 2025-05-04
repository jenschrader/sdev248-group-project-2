extends Area2D

@export var target_scene: String
@export var spawn_position: Vector2 = Vector2.ZERO
@export var message: String
var warp_prompt_active = false

func _on_body_entered(body):
	if body.name == "Player":
		if not GameManager.all_objects_checked():
			get_tree().call_group("dialogue", "show_message", "I should check all the barrels first.")
			return
		show_warp_prompt()
		
func _on_body_exited(body):
	if body.name == "Player":
		hide_warp_prompt()

func show_warp_prompt():
	warp_prompt_active = true
	get_tree().call_group("dialogue", "show_message", message)

func hide_warp_prompt():
	warp_prompt_active = false
	get_tree().call_group("dialogue", "hide_message")  

func _unhandled_input(event):
	if warp_prompt_active:
		if event.is_action_pressed("yes"):  
			get_tree().change_scene_to_file(target_scene)
		elif event.is_action_pressed("no"): 
			hide_warp_prompt()
