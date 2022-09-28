extends VBoxContainer

var skill: Skill
var orchestrator

func init(skill: Skill, orchestrator):
	self.skill = skill
	self.orchestrator = orchestrator
	self.name = skill.name
	$Button.text = skill.name
	$ProgressBar.max_value = skill.max_cooldown

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	if skill != null:
		$ProgressBar.value = skill.cooldown

func _on_button_pressed():
	print(self.name)
	orchestrator.select_skill(skill)
	

func toggle(value = null):
	$Button.disabled = !value
