class_name Entity

var health = 500
var max_health = 500
var body_parts = [
	Head.new(100, 100, 0.25,  self),
	Part.new("Left Arm", 150, 150, 0.50, self),
	Part.new("Torso", 300, 300, 0.75, self),
	Part.new("Right Arm", 150, 150, 0.50, self),
	Part.new("Left Leg", 150, 150, 0.50, self),
	Part.new("Right Leg", 150, 150, 0.50, self)
]

var body_parts_order = [
	[0],
	[1, 2, 3],
	[4, 5]
]

var slots = {
	"Left Arm": Items.weapon("Sword"),
	"Right Arm": Items.weapon("Mace")
}

var accuracy = 1.5

var name

func _init(name: String):
	self.name = name

func damage(amount: float):
	health = max(0, health - amount)

func skills():
	var list = []
	for item in slots.values():
		if item != null:
			list.append_array(item.skills)
	return list
