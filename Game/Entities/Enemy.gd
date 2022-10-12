class_name Enemy
extends Entity

func _init(name: String).(name):
	slots = [Slot.new("Left Arm", Items.weapon("Sword"))]
#	slots["Left Arm"] = Items.weapon("Sword")

#	stats["speed"] = 12
#	print(stats["speed"])
	return
