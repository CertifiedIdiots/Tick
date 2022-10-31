extends Node

var weapons = {
	"Sword": Sword,
	"Mace": Mace,
	"Spear": Spear
}

class Sword extends Item:
	func _init().("Sword", ["Left Arm", "Right Arm"], [Skills.get("Slash")]):
		pass

class Mace extends Item:
	func _init().("Mace", ["Left Arm", "Right Arm"], [Skills.get("Slash")]):
		pass

class Spear extends Item:
	func _init().("Spear", [], [Skills.get("Slash")]):
		pass

func weapon(name: String):
	return weapons[name].new()
	
	
var armor = {
	"Helmet": Helmet,
	"Chestplate": Chestplate,
	"Leggings": Leggings
}

class Helmet extends Item:
	func _init().("Helmet", ["Head"], [], [1, 4, 2]):
		pass

class Chestplate extends Item:
	func _init().("Chestplate", ["Torso"]):
		pass

class Leggings extends Item:
	func _init().("Leggings", ["Legs"]):
		pass

func armor(name: String):
	return armor[name].new()
