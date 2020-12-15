extends Area2D

export var speed : = 400.0
var path : = PoolVector2Array() setget set_path

func _ready():
	set_process(false)
	
func _process(delta) -> void:
	var move_distance : = speed * delta
	move_along_path(move_distance)
	
func move_along_path(distance: float) -> void:
	var last_point : = position
	for i in range(path.size()):
		var distance_to_next : = start_point.distance_to

func set_path(value : PoolVector2Array) -> void:
	path = value
	if  value.size() == 0:
		return
	set_process(true)
