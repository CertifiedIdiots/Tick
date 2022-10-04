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
	
func use(owner, on: Part):
	var hit_chance = (on.hit_chance * owner.accuracy) 
	var result = randf()
	if result < hit_chance:
		on.damage(damage)
		print("HIT! - ", on.name, " ", "(", hit_chance*100, "%)")
	else:
		print("MISSED! - ", on.name, " ", "(", hit_chance*100, "%)")
