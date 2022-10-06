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
	var dodge_chance = on.owner.dodge_chance
	var random_chance = 0.2
	
	var result = randf()
	var dodge_result = randf()
	var random_result = randf()
	
	if result < hit_chance and dodge_result > dodge_chance:
		on.damage(damage)
		print("HIT! - ", on.name, " ", "(", hit_chance*100, "%)")
	elif result > hit_chance and random_result < random_chance and dodge_result > dodge_chance:
		on.owner.get_random_part(on).damage(damage)
		print("HIT RANDOM!")
	elif result > hit_chance and random_result > random_chance and dodge_result > dodge_chance:
		print("MISSED! - ", on.name, " ", "(", hit_chance*100, "%)")
	else:
		print("DODGED!")
