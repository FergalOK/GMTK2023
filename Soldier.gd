extends Node2D

@export var strength: int = 50
@export var loyalty: int = 50
@export var parent: Node
@export var index: int
var chosen = false

func _ready():
	$Text.text = "Strength: %s\nLoyalty: %s" % [strength, loyalty]
	print("Text ", $Text.text)
	$Button.modulate = Color(0, 0, 0, 0)

func _on_button_button_down():
	var traitor = randi_range(0, 100) > loyalty
	Global.selected.remove_at(index)
	if not traitor:
		if Global.selected.is_empty():
			get_tree().change_scene_to_file("res://scenes/End.tscn")
		Global.strength += strength
		queue_free()
	else:
		Global.fight = Vector2i(strength, loyalty)
		
		get_tree().change_scene_to_file("res://scenes/Main.tscn")
	parent.toggle_selection(self)

