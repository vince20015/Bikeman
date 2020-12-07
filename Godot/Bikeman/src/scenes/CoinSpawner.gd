extends Area2D

onready var collectable = preload("res://src/actors/collectable.tscn")

func _ready():
	position = Vector2(0,0)
	var col = collectable.instance()
	var viewportSize = Vector2(get_viewport().size)
	var tiles = Vector2(viewportSize.x / 32, viewportSize.y / 32)
	for n in range(tiles.y):
		for i in range(tiles.x):
			position.x += 32
			if $".".is_colliding():
				pass
			else:
				add_child(col)
			
			
