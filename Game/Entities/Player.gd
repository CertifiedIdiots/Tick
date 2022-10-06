class_name Player
extends Entity

func _init(name: String).(name):
	slots["Right Arm"] = Items.weapon("Spear")
	
	# ^^ why does this work for enemy but not player?
