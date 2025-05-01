extends CharacterBody2D

@export var speed := 100
var input_vector := Vector2.ZERO
var can_interact := false
var current_interactable: Node = null

func _physics_process(delta):
	input_vector = Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	).normalized()

	velocity = input_vector * speed
	move_and_slide()

func _input(event):
	if event.is_action_pressed("interact") and can_interact and current_interactable:
		current_interactable.interact()

func set_interactable(interactable):
	can_interact = true
	current_interactable = interactable

func clear_interactable():
	can_interact = false
	current_interactable = null
