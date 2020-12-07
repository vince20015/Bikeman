extends Area2D




func _on_Collectable_body_entered(body):
	if body == $"Player":
		queue_free()
