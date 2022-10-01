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

var skills = [
	Skill.new("BASH", 5, 50, self),
	Skill.new("SLASH", 3, 30, self),
	Skill.new("STAB", 1, 10, self)
]

var accuracy = 3.0

var name

func _init(name: String):
	self.name = name

func damage(amount: float):
	health = max(0, health - amount)
