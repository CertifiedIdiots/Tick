extends Node

var weapons = {
	"Sword": Sword,
	"Mace": Mace,
	"Spear": Spear
}

class Sword extends Item:
	func _init().("Sword", ["Left Arm", "Right Arm"], [Skill.new("SLASH", 3, 25)]):
		pass

class Mace extends Item:
	func _init().("Mace", ["Left Arm", "Right Arm"], [Skill.new("BASH", 5, 50)]):
		pass

class Spear extends Item:
	func _init().("Spear", [], [Skill.new("STAB", 1, 10)]):
		pass

func weapon(name: String):
	return weapons[name].new()
	
var armor = {
	"Helmet": Helmet,
	"Chestplate": Chestplate,
	"Leggings": Leggings
}

class Helmet extends Item:
	func _init().("Helmet", ["Head"]):
		pass

class Chestplate extends Item:
	func _init().("Chestplate", ["Torso"]):
		pass

class Leggings extends Item:
	func _init().("Leggings", ["Legs"]):
		pass

func armor(name: String):
	return armor[name].new()
