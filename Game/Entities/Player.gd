class_name Player
extends Entity

func _init(name: String).(name):
	
	stats["accuracy"] = 1.0 + add_accuracy
	stats["crit_chance"] = 0.1 + add_crit
	stats["dodge_chance"] = 0.1 + add_dodge
	stats["speed"] = 10 + add_speed
	stats["defense"] = 0 + add_defense
	print(stats["speed"])
	
	body_parts = [
		Head.new(100, 100, 0.25,  self),
		Arm.new(150, 150, 0.50, self),
		Part.new("Torso", 300, 300, 0.75, self),
		Arm.new(150, 150, 0.50, self),
		Part.new("Left Leg", 150, 150, 0.50, self),
		Part.new("Right Leg", 150, 150, 0.50, self)
	]
	
	body_parts_order = [
		[0],
		[1, 2, 3],
		[4, 5]
	]
	
	slots = [
		Slot.new("Left Arm", Items.weapon("Sword")),
		Slot.new("Right Arm", Items.weapon("Mace")),
		Slot.new("Third Arm", Items.weapon("Spear")),
		Slot.new("Head", Items.armor("Helmet")),
		Slot.new("Torso", Items.armor("Chestplate")),
		Slot.new("Legs", Items.armor("Leggings")),
	]
	
	body_parts[1].slot = slots[0]
	body_parts[2].slot = slots[1]
