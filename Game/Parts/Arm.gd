extends Part
class_name Arm

func _init(health: float, maximum_health: float, hit_chance: float, owner).("Arm", health, maximum_health, hit_chance, owner):
	pass

func damage(amount):
	health = max(0, health - amount)
	owner.damage(amount)
	if health <= 0:
		if slot != null:
			slot.disable()
