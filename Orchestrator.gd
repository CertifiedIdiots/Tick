extends Node
var skill_scene = preload("res://Skill.tscn")

var player = Entity.new("YOU")
var enemy = Entity.new("THEM")
var skill_selected: Skill

var player_container: Node
var enemy_container: Node
var skills_container: Node

func _ready():
	var root = get_parent()
	
	player_container = root.find_child("Player")
	init_entity(player, player_container)
		
	enemy_container = root.find_child("Enemy")
	init_entity(enemy, enemy_container)
		
	skills_container = root.find_child("Skills")
	for skill in player.skills:
		var scene = skill_scene.instantiate()
		scene.init(skill, self)
		skills_container.add_child(scene)

func init_entity(entity: Entity, container: Node):
	for part in entity.body_parts:
		container.find_child(part.name).init(part, self)
	container.get_node("HealthBar").init(entity)
		
func select_skill(skill: Skill):
	skill_selected = skill
	toggle_parts(true)

func use_skill(on: Part):
	skill_selected.use(on)
	skills_container.get_node(skill_selected.name).toggle(true)
	skill_selected.cooldown = 0
	skill_selected = null
	toggle_parts(false)

func toggle_parts(value: bool):
	for part in enemy.body_parts:
		enemy_container.find_child(part.name).toggle(value)

func _process(delta):
	for skill in player.skills:
		skill.cooldown = min(skill.max_cooldown, skill.cooldown + delta)
