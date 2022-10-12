class_name Entity

var name

var health = 500
var max_health = 500
var accuracy = 1.5
var dodge_chance = 0.1

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

var slots = []

func _init(name: String):
	self.name = name

func damage(amount: float):
	health = max(0, health - amount)

func skills():
	var list = []
	for slot in slots:
		if not slot.disabled:
			list.append_array(slot.skills())
	return list

func get_random_part(exclude: Part):
	while true:
		var index = randi() % body_parts.size()
		if body_parts[index] != exclude:
			return body_parts[index]
	
