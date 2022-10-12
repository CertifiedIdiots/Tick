class_name Item

var name: String
var slots
var skills

func _init(name: String, slots, skills = []):
	self.name = name
	self.slots = slots
	self.skills = skills
