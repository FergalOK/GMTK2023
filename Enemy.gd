extends Node2D

const bar_size = 50
var life: int = 5
var bar_ratio: int

func _ready():
	print("Ratio ", bar_ratio)
	$Healthbar/Sprite2D.scale = Vector2(bar_ratio * life, 20)

func set_life(new_life: int):
	life = new_life
	bar_ratio = max(bar_size / life, 1)


func pain():
	life -= 2
	if life <= 0:
		queue_free()
	$Healthbar/Sprite2D.scale = Vector2(bar_ratio * life, 20)
