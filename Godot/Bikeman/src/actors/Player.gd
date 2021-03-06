extends Area2D

export var speed = 7

onready var tween = $Tween
onready var ray = $RayCast2D

var moving = false
var temp_dir
var tile_size = 32
var inputs = {
	"RIGHT": Vector2.RIGHT,
	"LEFT": Vector2.LEFT,
	"UP": Vector2.UP,
	"DOWN": Vector2.DOWN,
	"STOP": Vector2.ZERO,
}

var newDir

func _ready():
	position = position.snapped(Vector2.ONE * tile_size)
	position += Vector2.ONE * tile_size/2
	newDir
	
func _unhandled_input(event):
	for dir in inputs.keys():
		if event.is_action(dir):
			newDir = dir


func _process(delta):
	if tween.is_active():
		return
	for dir in inputs.keys():
		move(dir)
		print("This is from VSCode")
	
	
func move(dir):
	ray.cast_to = inputs[dir] * tile_size
	ray.force_raycast_update()
	if !ray.is_colliding():
		move_tween(dir)
	else:
		dir = "STOP"
		
func move_tween(dir):
	tween.interpolate_property(self, "position",
	position, position + inputs[dir] * tile_size,
		1.0/speed, Tween.TRANS_LINEAR)
	tween.start()


