extends Area2D

export var speed = 8

const tile_size = 32
onready var tween = $Tween
onready var ray = $RayCast2D

var directions = {
	"RIGHT": Vector2.RIGHT,
	"LEFT": Vector2.LEFT,
	"UP": Vector2.UP,
	"DOWN": Vector2.DOWN,
	"STOP": Vector2.ZERO,
}

var newdir = Vector2.LEFT
var dir = directions.LEFT
var noCol = true


func _ready():
	position = position.snapped(Vector2.ONE * tile_size)
	position += Vector2.ONE * tile_size/2
	
func _process(delta):
	if tween.is_active():
		return
	if newdir != dir:
		ray.cast_to = directions[newdir] * tile_size
		ray.force_raycast_update()
		if !ray.is_colliding():
			dir = newdir
			move_tween(dir)
		else:
			move_tween(dir)
	
	if Input.is_action_pressed("DOWN"):
		
		
func move_tween(dir):
	tween.interpolate_property(self, "position",
	position, position + directions[dir] * tile_size,
		1.0/speed, Tween.TRANS_LINEAR)
	tween.start()


