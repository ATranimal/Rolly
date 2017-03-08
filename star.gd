
extends Sprite

# member variables here, example:
# var a=2
# var b="textvar"

func _ready():
	set_process(true)

func _process(delta):
	if (!scene.get_node("Fades/Fade 1/AnimationPlayer").is_playing() && 


