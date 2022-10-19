class_name Skill
	
class effect:
	var damage: float
	var block: bool
	var accuracy: float
	var crit_chance: float
	var dodge_chance: float
	var defense: float
	var speed: float
	
class damage_type:
	var slash
	var blunt
	var pierce

var name: String
var slots
var cooldown: float
var max_cooldown: float
var type: damage_type
var effects: effect
var disabled = false
const random_chance = 0.1

func _init(name: String, slots, cooldown: float, type: damage_type, effects: effect):
	self.name = name
	self.slots = slots
	self.cooldown = cooldown
	self.max_cooldown = cooldown
	self.type = type
	self.effect = effects
	
func use(owner, on: Part):
	var hit_chance = (on.hit_chance * owner.stats["accuracy"])

	var hit = randf() < hit_chance
	var failed_dodge = randf() > on.owner.stats["dodge_chance"]
	var hit_random_part = randf() > random_chance

	if effects is effect.damage:
		if hit and failed_dodge:
			on.damage(effect.damage)
			print("HIT! - ", on.name, " ", "(", hit_chance*100, "%)")
		elif not hit and hit_random_part and failed_dodge:
			on.owner.get_random_part(on).damage(effect.damage)
			print("HIT RANDOM!")
		elif not hit and not hit_random_part and failed_dodge:
			print("MISSED! - ", on.name, " ", "(", hit_chance*100, "%)")
		else:
			print("DODGED!")
	else: return
