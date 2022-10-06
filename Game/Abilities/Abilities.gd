extends Node

var spells = {
	"Precision": Precision
}

class Precision extends Spell:
	func _init().("Precision", ["Ability1", "Ability2"], 10, 0, null):
		pass

func spell(name: String):
	return spells[name].new()
