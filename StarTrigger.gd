
extends Node2D

onready var scene = get_parent().get_parent()
onready var rolly = scene.get_node("rolly")
onready var sprite = get_node("StarSprite")
onready var trig = get_node("StarTrigger")
var complete = 0

func _ready():
	trig.connect("body_enter", self, "_on_trigger")
	trig.connect("body_exit", self, "_on_exit")
	pass

func _process(delta):
	if Input.is_action_pressed("Down"):
		rolly.canMove = false
		scene.get_node("Ambient Light/AnimationPlayer").play("Lights on")
		sprite.get_node("Boss Camera").make_current()
		get_node("Particles2D").set_emitting(false)
		rolly.set_sleeping(true)
		complete = 1;
		set_process(false)
	

func _on_trigger(rolly):
	if (complete == 0 && scene.get_node("Elevator Button").complete == 1):
		set_process(true)

func _on_exit(rolly):
	set_process(false)
	
func rise_finish():
	get_node("StarSprite").set_opacity(0);
	get_node("Shards/Particles2D").set_emitting(true);
	get_node("Shards/Shard1").begin();
	get_node("Shards/Shard2").begin();
	get_node("Shards/Shard3").begin();
	get_node("Shards/Shard4").begin();
	rolly.canMove = true;
	while(sprite.get_node("Boss Camera").get_pos().x < 0):
		return
	