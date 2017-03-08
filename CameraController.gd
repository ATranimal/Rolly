
extends Node2D

onready var scene = get_parent()
onready var rolly = scene.get_node("rolly")
var counter = 0

func _process(delta):
	counter += delta
	randomize()
	var invert = 30/counter * 10
	var temp = Vector2(rand_range(-invert,invert), rand_range(-invert,invert))
	rolly.get_node("Camera2D").set_pos(temp)
	if (counter > 4.9):
		rolly.get_node("Camera2D").set_pos(Vector2(0,0))
		rolly.canMove = true
		rolly.set_sleeping(false)
		set_process(false)

func shake():
	set_process(true)
	