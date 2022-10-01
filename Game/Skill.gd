class_name Skill

var name: String
var cooldown: float
var max_cooldown: float
var damage: float

func _init(name: String, cooldown: float, damage: float):
	self.name = name
	self.cooldown = cooldown
	self.max_cooldown = cooldown
	self.damage = damage
	
func use(on: Part):
	on.damage(damage)
