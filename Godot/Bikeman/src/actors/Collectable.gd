extends Area2D


func _on_Collectable_body_entered(body):
		queue_free()


func _on_Collectable_area_entered(area):
	if area.name == "Player":
		GlobalVars.score += 1
		queue_free()
