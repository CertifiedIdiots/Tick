extends Node

var weapons = {
	"Sword": Sword,
	"Mace": Mace
}

class Sword extends Weapon:
	func _init().("Sword", ["Left Arm", "Right Arm"], [Skill.new("SLASH", 3, 25)]):
		pass

class Mace extends Weapon:
	func _init().("Mace", ["Left Arm", "Right Arm"], [Skill.new("BASH", 5, 50)]):
		pass

func weapon(name: String):
	return weapons[name].new()
