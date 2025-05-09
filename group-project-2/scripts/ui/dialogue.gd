extends Control

# ───────────────────────────────────────────────
# dialogue ui (typewriter effect with continue prompt)
# handles showing text with delays, guards against spam
# ───────────────────────────────────────────────

@onready var label = $Panel/MessageLabel
@onready var continue_icon = $Panel/ContinueIcon

var can_advance := false
var message_showing := false

# displays a message using typewriter animation
func show_message(text):
	if message_showing:
		return  # prevent overlapping calls
		
	print("showing message (typewriter):", text) # debug; optional
	
	message_showing = true
	label.text = "" # reset text string label b4 starting
	label.visible = true # make sure label is visible
	$Panel.visible = true # make sure panel is visible
	visible = true # make sure everything is visible (probs overkill)
	continue_icon.visible = false # set continue icon visibility to false for now until txt finishes
	can_advance = false # set can_advance boolean to false for now; prevents advancing b4 txt is finished
	
	# this part is the typewriter portion
	for i in text.length(): # for loop for chars
		label.text += text[i] # get each indvidual letter
		await get_tree().create_timer(0.03).timeout  # typing speed

	await get_tree().create_timer(0.3).timeout  # slight pause before continue
	continue_icon.visible = true # now set continue icon to visible, after txt is finished!
	can_advance = true # set bool to true so txt can advance (if there's multiple lines etc)
	message_showing = false

# hides the message and resets dialogue state
func hide_message():
	label.text = ""
	label.visible = false
	continue_icon.visible = false
	$Panel.visible = false
	visible = false
	can_advance = false
	message_showing = false


# handles input for advancing after message is finished
func _input(event):
	if event.is_action_pressed("interact") and visible and continue_icon.visible and can_advance:
		visible = false
