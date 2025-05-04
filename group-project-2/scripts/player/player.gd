extends CharacterBody2D

@export var speed := 100

@onready var camera := $Camera2D
@onready var sprite := $AnimatedSprite2D
@onready var interact_icon = $InteractIcon

var input_vector := Vector2.ZERO
var can_interact := false
var current_interactable: Node = null
var bounce_tween: Tween = null

func _ready():
	sprite.animation = "idle_down"
	sprite.flip_h = false
	sprite.play()

func _physics_process(delta):
	input_vector = Vector2(
		Input.get_action_strength("ui_right") - Input.get_action_strength("ui_left"),
		Input.get_action_strength("ui_down") - Input.get_action_strength("ui_up")
	).normalized()

	velocity = input_vector * speed
	move_and_slide()
	
	update_anim()
	
func _input(event):
	if event.is_action_pressed("interact") and can_interact and current_interactable:
		current_interactable.interact()


func update_anim():
	if input_vector == Vector2.ZERO:
		# idle anim
		if sprite.animation.begins_with("walk"):
			var dir = sprite.animation.substr(5) # remove "walk_" to get dir
			sprite.animation = "idle_" + dir
	else:
		# walk anim
		if abs(input_vector.x) > abs(input_vector.y):
			sprite.animation = "walk_side"
			sprite.flip_h = input_vector.x <0
		elif input_vector.y < 0:
			sprite.animation = "walk_up"
			sprite.flip_h = false
		else:
			sprite.animation = "walk_down"
			sprite.flip_h = false
	if not sprite.is_playing():
		sprite.play()
		
		
func set_interactable(interactable):
	can_interact = true
	current_interactable = interactable
	interact_icon.visible = true
	interact_icon.scale = Vector2(0.0, 0.0)

	var tween = create_tween()
	tween.tween_property(interact_icon, "scale", Vector2(0.6, 0.6), 0.25)\
		.set_trans(Tween.TRANS_BACK)\
		.set_ease(Tween.EASE_OUT)

	print("interactable ", interactable)


func clear_interactable():
	can_interact = false
	current_interactable = null

	var tween = create_tween()
	tween.tween_property(interact_icon, "scale", Vector2(0.0, 0.0), 0.2)\
		.set_trans(Tween.TRANS_QUAD)\
		.set_ease(Tween.EASE_IN)

	await tween.finished
	interact_icon.visible = false
		
func set_gun_visible():
	sprite.animation = "has_gun"
	sprite.flip_h = false 
	zoom_to(Vector2(1.5, 1.5))

func zoom_to(target_zoom: Vector2):
	if camera:
		print("Zooming from:", camera.zoom, "to:", target_zoom)
		var tween = get_tree().create_tween()
		tween.tween_property(camera, "zoom", target_zoom, 1.0)
	else:
		print("Camera not found!")
		
