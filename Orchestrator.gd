extends Node
var skill_scene = preload("res://Skill.tscn")

var player = Entity.new()
var enemy = Entity.new()
var skill_selected: Skill

var player_container: Node
var enemy_container: Node
var skills_container: Node

func _ready():
	player_container = get_parent().find_child("Player")
	print(player_container)
	for part in player.body_parts:
		player_container.find_child(part.name).init(part, self)
		
	enemy_container = get_parent().find_child("Enemy")
	for part in enemy.body_parts:
		enemy_container.find_child(part.name).init(part, self)
		
	skills_container = get_parent().find_child("Skills")
	for skill in player.skills:
		var scene = skill_scene.instantiate()
		scene.init(skill, self)
		skills_container.add_child(scene)
		
func select_skill(skill: Skill):
	skill_selected = skill
	toggle_parts(true)
	skills_container.get_node(skill.name).toggle(false)
	for s in player.skills:
		if s != skill:
			skills_container.get_node(s.name).toggle(true)

func use_skill(on: Part):
	skill_selected.use(on)
	skills_container.get_node(skill_selected.name).toggle(true)
	skill_selected = null
	toggle_parts(false)

func toggle_parts(value: bool):
	for part in enemy.body_parts:
		enemy_container.find_child(part.name).toggle(value)

func _process(delta):
	pass
