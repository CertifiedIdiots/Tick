extends VBoxContainer

var part: Part
var orchestrator

func init(part: Part, orchestrator):
	self.part = part
	self.orchestrator = orchestrator
	self.name = part.name
	$Button.text = part.name

func _process(delta):
	if part != null:
		$ProgressBar.value = (part.health/part.maximum_health)*100

func toggle(value: bool):
	$Button.disabled = !value

func _on_button_pressed():
	orchestrator.use_skill(part)
