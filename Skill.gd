class_name Skill

var name: String
var cooldown: float
var max_cooldown: float

func _init(name: String, cooldown: float):
	self.name = name
	self.cooldown = 0
	self.max_cooldown = cooldown
	
func use(on: Part):
	on.damage(30)
