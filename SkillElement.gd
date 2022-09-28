extends VBoxContainer

var skill: Skill
var orchestrator
var selected = false

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
		if skill.cooldown < skill.max_cooldown or orchestrator.skill_selected == skill:
			$Button.disabled = true
		else:
			$Button.disabled = false

func _on_button_pressed():
	orchestrator.select_skill(skill)

func toggle(value = null):
	$Button.disabled = !value
