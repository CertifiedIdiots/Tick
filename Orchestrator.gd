extends Node
var skill_scene = preload("res://Components/Skill.tscn")
var part_scene = preload("res://Components/Part.tscn")

var random = RandomNumberGenerator.new()

var player = Entity.new("YOU")
var enemy = Enemy.new("THEM")
var skill_selected: Skill

var player_container: Node
var enemy_container: Node
var skills_container: Node

func _ready():
	var root = get_parent()
	
	player_container = root.find_node("Player")
	init_entity(player, player_container)
		
	enemy_container = root.find_node("Enemy")
	init_entity(enemy, enemy_container)
		
	skills_container = root.find_node("Skills")
	for skill in player.skills():
		var scene = skill_scene.instance()
		scene.init(skill, self)
		skills_container.add_child(scene)
		
	random.randomize()

func init_entity(entity: Entity, container: Node):
	for list in entity.body_parts_order:
		var row = HBoxContainer.new()
		row.size_flags_horizontal = 3
		row.size_flags_vertical = 3
		container.add_child(row)
		for index in list:
			var part = entity.body_parts[index]
			var scene = part_scene.instance()
			scene.init(part, self)
			row.add_child(scene)

	container.get_node("HealthBar").init(entity)
		
func select_skill(skill: Skill):
	skill_selected = skill
	toggle_parts(true)

func use_skill(on: Part):
	skill_selected.use(player, on)
	skills_container.get_node(skill_selected.name).toggle(true)
	skill_selected.cooldown = 0
	skill_selected = null
	toggle_parts(false)

func toggle_parts(value: bool):
	for part in enemy.body_parts:
		enemy_container.find_node(part.name, true, false).toggle(value)

func _process(delta):
	for skill in player.skills():
		skill.cooldown = min(skill.max_cooldown, skill.cooldown + delta)
		
	if enemy.health <= 0:
		return
		
	for skill in enemy.skills():
		skill.cooldown = min(skill.max_cooldown, skill.cooldown + delta)
		if skill.cooldown >= skill.max_cooldown:
			skill.use(enemy, player.body_parts[random.randi_range(0, player.body_parts.size() - 1)])
			skill.cooldown = 0
