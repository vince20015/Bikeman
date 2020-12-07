extends KinematicBody2D

export var speed = 70
var motion = Vector2()
var lastPosition = Vector2(0,0)

func _physics_process(delta):
	#finding current moving direction
	if lastPosition.x == position.x:
		motion.x = 0
	if lastPosition.y == position.y:
		motion.y = 0
	
	if Input.is_action_pressed("UP"):
		rotation_degrees = 0
		motion.y = -speed
	if Input.is_action_pressed("DOWN"):
		rotation_degrees = 180
		motion.y = speed
	if Input.is_action_pressed("LEFT"):
		rotation_degrees = 270
		motion.x = -speed
	if Input.is_action_pressed("RIGHT"):
		rotation_degrees = 90
		motion.x = speed
	
	lastPosition = position
	move_and_slide(motion)
