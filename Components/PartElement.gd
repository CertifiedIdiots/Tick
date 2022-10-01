extends VBoxContainer

var part: Part
var orchestrator

func init(part: Part, orchestrator):
	self.part = part
	self.orchestrator = orchestrator
	self.name = part.name
	$Button.text = part.name
	$ProgressBar.max_value = part.maximum_health

func _process(delta):
	if part != null:
		$ProgressBar.value = part.health

func toggle(value: bool):
	$Button.disabled = !value

func _on_button_pressed():
	orchestrator.use_skill(part)
