class_name Spell

var name: String
var cooldown: float
var max_cooldown: float
var effect
var disabled = false

func _init(name: String, slots, cooldown, effect, disabled):
	self.name = name
	self.slots = slots
	self.cooldown = cooldown
	self.effect = effect
	self.disabled = disabled
