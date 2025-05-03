extends CharacterBody2D

@export var speed := 100

@onready var camera := $Camera2D

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
	print("interactable ", interactable)

func clear_interactable():
	can_interact = false
	current_interactable = null
	
func set_gun_visible():
	$AnimatedSprite2D.play("has_gun")  
	zoom_to(Vector2(1.5, 1.5))

func zoom_to(target_zoom: Vector2):
	if camera:
		print("Zooming from:", camera.zoom, "to:", target_zoom)
		var tween = get_tree().create_tween()
		tween.tween_property(camera, "zoom", target_zoom, 1.0)
	else:
		print("Camera not found!")
