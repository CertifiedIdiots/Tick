class_name Part

var name: String
var health: float
var maximum_health: float
var hit_chance: float
var owner
var slot

func _init(name: String, health: float, maximum_health: float, hit_chance: float, owner):
	self.name = name
	self.health = health
	self.maximum_health = maximum_health
	self.hit_chance = hit_chance
	self.owner = owner

func damage(amount: float):
	health = max(0, health - amount)
	owner.damage(amount)
