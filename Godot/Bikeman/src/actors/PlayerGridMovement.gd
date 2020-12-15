extends Area2D

#inizialisation----------------------------------------
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

#Starting parameters
var newDir = directions.STOP
var currentDir = directions.STOP


	
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
	#check if player is  in the "Animation"
	if tween.is_active():
		return
	#Check if player has entered a new direction
	if newDir == Vector2.ZERO:
		ray.cast_to = currentDir * tile_size
		ray.force_raycast_update()
		#check for collisions in the current direction
		if !ray.is_colliding():
			move_tween(currentDir)
	#new direction has been entered
	else:
		#check for collisions
		ray.cast_to = newDir * tile_size
		ray.force_raycast_update()
		if !ray.is_colliding():
			currentDir = newDir
			move_tween(newDir)
		#if there is an collision just continue on current direction
		else:
			ray.cast_to = currentDir * tile_size
			ray.force_raycast_update()
			if !ray.is_colliding():
				move_tween(currentDir)
		#set the newDir to ZERO (no input)
		newDir = Vector2.ZERO
	


func move_tween(dir):
	tween.interpolate_property(self, "position",
	position, position + dir * tile_size,
		1.0/speed, Tween.TRANS_LINEAR)
	tween.start()


