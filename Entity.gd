class_name Entity

var health = 150
var max_health = 150
var body_parts = [
	Part.new("Head", 100, 100, self),
	Part.new("Left Arm", 100, 100, self),
	Part.new("Torso", 100, 100, self),
	Part.new("Right Arm", 100, 100, self),
	Part.new("Left Leg", 100, 100, self),
	Part.new("Right Leg", 100, 100, self)
]

var skills = [
	Skill.new("BASH", 5),
	Skill.new("SLASH", 3)
]

var name

func _init(name: String):
	self.name = name

func damage(amount: float):
	health = max(0, health - amount)
