class_name Skill

var name: String
var cooldown: float
var max_cooldown: float
var damage: float
const random_chance = 0.2

func _init(name: String, cooldown: float, damage: float):
	self.name = name
	self.cooldown = cooldown
	self.max_cooldown = cooldown
	self.damage = damage
	
func use(owner, on: Part):
	var hit_chance = (on.hit_chance * owner.accuracy) 

	var hit = randf() < hit_chance
	var failed_dodge = randf() > on.owner.dodge_chance
	var hit_random_part = randf() > random_chance
	
	if hit and failed_dodge:
		on.damage(damage)
		print("HIT! - ", on.name, " ", "(", hit_chance*100, "%)")
	elif not hit and hit_random_part and failed_dodge:
		on.owner.get_random_part(on).damage(damage)
		print("HIT RANDOM!")
	elif not hit and not hit_random_part and failed_dodge:
		print("MISSED! - ", on.name, " ", "(", hit_chance*100, "%)")
	else:
		print("DODGED!")
