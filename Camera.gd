
extends Node2D

onready var scene = get_parent()
onready var rolly = scene.get_node("Rolly")

func _process(delta):
	

func shake():
	set_process(true)