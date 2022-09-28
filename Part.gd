class_name Part

var name: String
var health: float
var maximum_health: float

func _init(name: String, health: float, maximum_health: float):
	self.name = name
	self.health = health
	self.maximum_health = maximum_health

func damage(amount: float):
	health = max(0, health - amount)
