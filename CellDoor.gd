extends Sprite

onready var trig = get_node("DoorTrigger")
onready var scene = get_parent()
onready var rolly = scene.get_node("rolly")


func _ready():
	trig.connect("body_enter", self, "_on_trigger")
	

func _on_trigger(rolly):
	get_node("AnimationPlayer").play("Door Open")
	scene.get_node("Fades/Fade 2/AnimationPlayer").play("Door Fade")