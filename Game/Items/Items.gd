extends Node

var weapons = {
	"Sword": Sword,
	"Mace": Mace,
	"Spear": Spear
}

class Sword extends Weapon:
	func _init().("Sword", ["Left Arm", "Right Arm"], [Skill.new("SLASH", 3, 25)]):
		pass

class Mace extends Weapon:
	func _init().("Mace", ["Left Arm", "Right Arm"], [Skill.new("BASH", 5, 50)]):
		pass

class Spear extends Weapon:
	func _init().("Spear", [], [Skill.new("STAB", 1, 10)]):
		pass

func weapon(name: String):
	return weapons[name].new()
	
var armor = {
	"Helmet": Helmet,
	"Chestplate": Chestplate,
	"Leggings": Leggings
}

class Helmet extends Armor:
	func _init().("Helmet", ["Head"], 10, -2):
		pass

class Chestplate extends Armor:
	func _init().("Chestplate", ["Torso"], 10, -2):
		pass

class Leggings extends Armor:
	func _init().("Leggings", ["Legs"], 10, -2):
		pass

func armor(name: String):
	return armor[name].new()
