
extends Area2D

onready var scene = get_parent()
onready var rolly = scene.get_node("rolly")
onready var arrow = get_node("Arrow")

func _ready():
	self.connect("body_enter", self, "_on_enter")
	self.connect("body_exit", self, "_on_exit")
	

func _on_enter(rolly):
	print("I'm a button")
	arrow.show()
	
func _on_exit(rolly):
	arrow.hide()
	