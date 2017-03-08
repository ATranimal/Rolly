
extends RigidBody2D

var accel = 30.0
var maxspeed = 50.0
onready var scene = get_parent()
var canMove = true
var shards = 0


func _ready():
	scene.get_node("Fades/Fade 1/AnimationPlayer").play("Door Fade");
	self.set_fixed_process(true)

	
func _fixed_process(delta):
	while(!canMove):
		return
	
	if !scene.get_node("Fades/Fade 1/AnimationPlayer").is_playing():
		if Input.is_action_pressed("Down"):
			self.set_gravity_scale(10)
			
		if(get_angular_velocity() < 2 && get_angular_velocity() > -2):
			self.set_angular_velocity(0);
			
		if Input.is_action_pressed("Left"):
			if (self.get_angular_velocity() > -maxspeed):
				self.set_angular_velocity(-accel)
				
		if Input.is_action_pressed("Right"):
			if (self.get_angular_velocity() < maxspeed):
				self.set_angular_velocity(accel)
				
				
		if (shards == 4):
			cameraFix()
			shards = 5;

func cameraFix():
	#scene.get_node("Ambient Light/Anim2").play("Camera")
	#print("ok..")
	#while (scene.get_node("Ambient Light/Anim2").is_playing()):
	#	pass
	scene.get_node("rolly/Camera2D").make_current();
	scene.get_node("Cell Door/AnimationPlayer").play("Door Open");
	
