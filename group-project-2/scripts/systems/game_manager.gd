extends Node

var has_gun := false
var objects_checked := []
var required_objects := []

func mark_checked(id):
	if id not in objects_checked:
		objects_checked.append(id)

func all_objects_checked() -> bool:
	for id in required_objects:
		if id not in objects_checked:
			return false
	return true

func register_required_object(id: String):
	if id not in required_objects:
		required_objects.append(id)
