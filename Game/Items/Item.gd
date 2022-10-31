class_name Item

var name: String
var slots
var skills
var stats

func _init(name: String, slots, skills = [], stats = {}):
	self.name = name
	self.slots = slots
	self.skills = skills
	self.stats = stats
