extends VBoxContainer

var part: Part
var animated_health: float
var orchestrator

func init(part: Part, orchestrator):
	self.part = part
	self.orchestrator = orchestrator
	self.name = part.name
	self.animated_health = part.health
	$Button.text = part.name
	$ProgressBar.max_value = part.maximum_health

func _process(delta):
	if part != null:
		if part.health != animated_health and !$Tween.is_active():
			update_health()
		$ProgressBar.value = animated_health

func update_health():
	$Tween.interpolate_property(self, "animated_health", animated_health, part.health, 0.3, Tween.TRANS_LINEAR, Tween.EASE_IN)
	$Tween.start()

func toggle(value: bool):
	$Button.disabled = !value

func _on_button_pressed():
	orchestrator.use_skill(part)
