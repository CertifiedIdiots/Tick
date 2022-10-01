extends Part
class_name Head

func _init(health: float, maximum_health: float, owner).("Head", health, maximum_health, owner):
	pass

func damage(amount):
	health = max(0, health - amount)
	owner.damage(amount)
	if health <= 0:
		owner.health = 0
