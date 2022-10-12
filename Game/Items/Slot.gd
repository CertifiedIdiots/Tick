class_name Slot

var disabled = false
var name: String
var item

func _init(name: String, item = null):
	self.name = name
	self.item = item

func skills():
	return item.skills if item != null else []

func disable():
	self.disabled = true
	if item != null:
		for skill in item.skills:
			skill.disabled = true
	
