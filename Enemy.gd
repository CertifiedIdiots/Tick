class_name Enemy
extends Entity

func _init(name: String):
	super(name)
	skills = [Skill.new("BASH", 3)]
