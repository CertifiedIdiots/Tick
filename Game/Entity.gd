class_name Entity

var health = 500
var max_health = 500
var body_parts = [
	Head.new(100, 100, self),
	Part.new("Left Arm", 150, 150, self),
	Part.new("Torso", 300, 300, self),
	Part.new("Right Arm", 150, 150, self),
	Part.new("Left Leg", 150, 150, self),
	Part.new("Right Leg", 150, 150, self)
]

var body_parts_order = [
	[0],
	[1, 2, 3],
	[4, 5]
]

var skills = [
	Skill.new("BASH", 5, 50),
	Skill.new("SLASH", 3, 30),
	Skill.new("STAB", 1, 10)
]

var name

func _init(name: String):
	self.name = name

func damage(amount: float):
	health = max(0, health - amount)
