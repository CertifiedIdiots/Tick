class_name Skill

var name: String
var slots
var cooldown: float
var max_cooldown: float
var disabled = false
const random_chance = 0.1
const damage = 50

func _init(name: String, slots, cooldown: float):
	self.name = name
	self.slots = slots
	self.cooldown = cooldown
	self.max_cooldown = cooldown
	
func use(owner, on: Part):
	var hit_chance = (on.hit_chance * owner.stats["accuracy"])

	var hit = randf() < hit_chance
	var failed_dodge = randf() > on.owner.stats["dodge_chance"]
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
