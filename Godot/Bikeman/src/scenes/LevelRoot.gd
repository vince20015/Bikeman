extends Node

var score = 0

func _process(delta):
	$Label.text = String(GlobalVars.score)
