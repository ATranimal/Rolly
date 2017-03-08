extends Node2D

onready var trig = get_node("ElevatorTrigger")
onready var scene = get_parent()
onready var rolly = scene.get_node("rolly")
var complete = 0

func _ready():
	trig.connect("body_enter", self, "_on_trigger")
	trig.connect("body_exit", self, "_on_exit")

func _on_exit(rolly):
	get_node("Arrow").set_opacity(0)
	set_process(false)

func _on_trigger(rolly):
	if(complete == 0):
		set_process(true)
	
func _process(delta):
		get_node("Arrow").set_opacity(1)
		if Input.is_action_pressed("Down"):
			get_node("Arrow").set_opacity(0)
			rolly.canMove = false
			rolly.set_sleeping(true)
			scene.get_node("Camera").shake()
			scene.get_node("Lights/Elevator Light/Light2D/AnimationPlayer").play("Flicker")
			scene.get_node("Lights/Cell Light/Light2D").set_enabled(false)
			scene.get_node("Lights/Door Light/Light2D").set_enabled(false)
			scene.get_node("Cell Door/AnimationPlayer").play_backwards("Door Open")
			scene.get_node("Post Elevator/Star Trigger/StarSprite").set_opacity(1)
			scene.get_node("Post Elevator/Star Trigger/Particles2D").set_emitting(true)
			complete = 1
			set_process(false)
			

