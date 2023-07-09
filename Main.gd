extends Node2D

var enemy_scene = preload("res://scenes/Enemy.tscn")

var enemies = []
var keypress = 0
@export var selected = []

func _ready():
	$HealthText.text = "Health: %s" % Global.strength
	$DamageTimer.start()
	
	selected = Global.selected
	print(Global.others)
	
	print(enemy_scene.resource_name)
	var enemy0 = enemy_scene.instantiate()
	enemy0.position = $EnemyPosition0.position
	enemy0.set_life(Global.fight[0])

	add_child(enemy0)
	
	enemies = [enemy0]
	
func get_front_enemy():
	while enemies and not enemies[0]:
		enemies.pop_front()
	if not enemies:
		if Global.selected.is_empty():
			get_tree().change_scene_to_file("res://scenes/End.tscn")
		else:
			get_tree().change_scene_to_file("res://scenes/Selector.tscn")
		return
	return enemies[0]
	
func _input(event):
	if event.is_action_pressed("attack"):
		var enemy = get_front_enemy()
		if enemy:
			enemy.pain()


func _on_damage_timer_timeout():
	Global.strength -= 1
	$HealthText.text = "Health: %s" % Global.strength
	print("Health: ", Global.strength)
	if Global.strength <= 0:
		get_tree().change_scene_to_file("res://scenes/Lose.tscn")

