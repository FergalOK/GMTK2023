extends Node2D

@export var soldier_scene: PackedScene
@export var main_scene: PackedScene


func _ready():
	$HealthText.text = "Health: %s" % Global.strength
	var i = 0
	for soldier_attr in Global.selected:
		var soldier = create_soldier(soldier_attr, i)
		add_child(soldier)
		i += 1

func create_soldier(attr, i):
	var x = i % 5
	var y = int(i / 5)
	var soldier = soldier_scene.instantiate()
	soldier.loyalty = attr.Loyalty
	soldier.strength = attr.Strength
	soldier.position = Vector2(248 * x, 248 * (y + 1))
	soldier.parent = self
	soldier.index = i
	return soldier

func toggle_selection(soldier):
	$HealthText.text = "Health: %s" % Global.strength
