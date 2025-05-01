extends Area2D

@export var message: String = "It's empty."

func interact():
	get_tree().call_group("Dialogue", "show_message", message)

func _on_body_entered(body):
	if body.name == "Player":
		body.set_interactable(self)

func _on_body_exited(body):
	if body.name == "Player":
		body.clear_interactable()
