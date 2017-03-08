
extends RigidBody2D

onready var trig = get_node("Area2D")
onready var scene = get_parent().get_parent().get_parent().get_parent()
onready var rollyReal = scene.get_node("rolly")

func _ready():
	set_opacity(0)
	trig.connect("body_enter", self, "_on_trigger")

func begin():
	randomize()
	set_opacity(1)
	var temp = Vector2(rand_range(-200, 200), -200)
	set_linear_velocity(temp)
	set_gravity_scale(2)
	set_process(true)
	
func _on_trigger(rolly):
	if (rolly == rollyReal):
		rollyReal.shards += 1
		print(rollyReal.shards)
		queue_free()
