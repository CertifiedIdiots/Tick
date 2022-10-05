class_name Armor

var name: String
var slots
var defense: float
var agility: float

func _init(name: String, slots, defense, agility):
	self.name = name
	self.slots = slots
	self.defense = defense
	self.agility = agility
