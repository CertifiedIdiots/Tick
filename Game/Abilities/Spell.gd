class_name Spell

var name: String
var slots
var cooldown: float
var max_cooldown: float
var damage: float
var effect

func _init(name: String, slots, cooldown: float, damage: float, effect):
	self.name = name
	self.slots = slots
	self.cooldown = cooldown
	self.damage = damage
	self.effect = effect
