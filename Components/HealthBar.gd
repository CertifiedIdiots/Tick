extends VBoxContainer

var entity: Entity

func init(entity: Entity):
	self.entity = entity
	$ProgressBar.max_value = entity.max_health
	$Label.text = entity.name

func _process(delta):
	if entity != null:
		$ProgressBar.value = entity.health
