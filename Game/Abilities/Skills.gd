extends Node

var skills = {
	"Slash": Slash
}

class Slash extends Skill:
	func _init().("Slash", ["Left Arm"], 10):
		pass

func get(name: String):
	return skills[name].new()


#var spells = {
#	"Precision": Precision
#}
#
#class Precision extends Skill:
#	func _init().("Precision", ["Ability1", "Ability2"], 10, 0, null):
#		pass
#
#func spell(name: String):
#	return spells[name].new()
