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

enum {UP, RIGHT, DOWN, LEFT}

var newDir = directions.LEFT
var currentDir = directions.LEFT
var dir = directions.LEFT
var noCol = true


func _ready():
	position = position.snapped(Vector2.ONE * tile_size)
	position += Vector2.ONE * tile_size/2
	
func _process(delta):
	#User Input----------------------------------------
	if Input.is_action_pressed("DOWN"):
		newDir = directions.DOWN
	
	if Input.is_action_pressed("UP"):
		newDir = directions.UP
	
	if Input.is_action_pressed("LEFT"):
		newDir = directions.LEFT
		
	if Input.is_action_pressed("RIGHT"):
		newDir = directions.RIGHT
		
#----------------------------------------------------------	

	if tween.is_active():
		return
	if newDir == Vector2.ZERO:
		ray.cast_to = currentDir * tile_size
		ray.force_raycast_update()
		if !ray.is_colliding():
			move_tween(currentDir)
	else:
		ray.cast_to = newDir * tile_size
		ray.force_raycast_update()
		if !ray.is_colliding():
			currentDir = newDir
			move_tween(newDir)
		else:
			ray.cast_to = currentDir * tile_size
			ray.force_raycast_update()
			if !ray.is_colliding():
				move_tween(currentDir)
		newDir = Vector2.ZERO
	


func move_tween(dir):
	tween.interpolate_property(self, "position",
	position, position + dir * tile_size,
		1.0/speed, Tween.TRANS_LINEAR)
	tween.start()


