extends Area2D

@export var target_scene: String
@export var spawn_position: Vector2 = Vector2.ZERO

func _on_body_entered(body):
	if body.name == "Player":
		if not GameManager.all_objects_checked():
			get_tree().call_group("dialogue", "show_message", "I should check all the barrels first.")
			return
		get_tree().change_scene_to_file(target_scene)
