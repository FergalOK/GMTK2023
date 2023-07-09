extends Node



@export var selected = []
@export var others = []
@export var strength = 50
@export var fight: Vector2i

func _init():
	for i in range(5):
		for j in range(2):
			var soldier = {}
			soldier.Loyalty = randi_range(1, 100)
			soldier.Strength = randi_range(1, 100)
			selected.append(soldier)

func battle(soldier):
	selected.remove_at(soldier.index)
	# soldier.queue_free()
	get_tree().change_scene_to_file("res://scenes/Main.tscn")

