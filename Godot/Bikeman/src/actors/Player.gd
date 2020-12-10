extends Area2D

export var speed = 3

onready var tween = $Tween
onready var ray = $RayCast2D

var tile_size = 32
var inputs = {
	"RIGHT": Vector2.RIGHT,
	"LEFT": Vector2.LEFT,
	"UP": Vector2.UP,
	"DOWN": Vector2.DOWN,
}

func _ready():
	position = position.snapped(Vector2.ONE * tile_size)
	position += Vector2.ONE * tile_size/2
	
func _unhandled_input(event):
	if tween.is_active():
		return
	for dir in inputs.keys():
		if event.is_action_pressed(dir):
			move(dir)
	
func move(dir):
	ray.cast_to = inputs[dir] * tile_size
	ray.force_raycast_update()
	if !ray.is_colliding():
		move_tween(dir)
		
func move_tween(dir):
	tween.interpolate_property(self, "position",
		position, position + dir * tile_size,
		1.0/speed, Tween.TRANS_SINE, Tween.EASE_IN_OUT)
	tween.start()



