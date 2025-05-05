extends Node

# ───────────────────────────────────────────────
# global game state manager (autoload)
# tracks:
# - whether the player has the gun
# - which interactable objects have been checked
# - which objects must be checked to progress
# ───────────────────────────────────────────────

var has_gun := false
var objects_checked := []
var required_objects := []

# called by interactables when they're interacted with
func mark_checked(id):
	if id not in objects_checked:
		objects_checked.append(id)

# returns true if ALL required objects have been interacted with
func all_objects_checked() -> bool:
	for id in required_objects:
		if id not in objects_checked:
			return false
	return true

# register an object as required for completion (called in _ready of interactables)
func register_required_object(id: String):
	if id not in required_objects:
		required_objects.append(id)
