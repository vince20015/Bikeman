extends Area2D

onready var nav_2d : Navigation2D = $Navigation2D
onready var line_2d : Line2D = $Line2D
onready var character : Area2D = self

func _unhandled_input(event):
	if !event is InputEventMouseButton:
		return
	if event.button_index != BUTTON_LEFT or !event.is_pressed():
		return
		
	var new_path : = nav_2d.get_simple_path(character.global_position, event.global_position)
	line_2d.points = new_path
	character.path
