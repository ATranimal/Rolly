
extends Area2D

onready var scene = get_parent().get_parent()
onready var rolly = scene.get_node("rolly")
onready var text = scene.get_node("Eraser/RichTextLabel")
var shards = 0
var textDisplay = false;
var counter = 0;
var counterMax = 1.2;

func _ready():
	connect("body_enter", self, "_on_trigger")
	connect("body_exit", self, "_on_exit")
	
func _on_exit(rolly):
	set_process(false)

func _on_trigger(rolly):
	set_process(true)
	
func _process(delta):
	if (rolly.shards == 5):
		shards = 1; 
	if (!textDisplay && Input.is_action_pressed("Down")):
		if (shards == 1):
			textDisplay = true;
			counterMax = 120;
			print2();
		else:
			textDisplay = true;
			print1();
			
	if (textDisplay):
		counter += delta
	
	if (counter > counterMax):
		text.clear();
		textDisplay = false;
		counter = 0
		
		
	if (counter > 5):
		scene.get_node("Eraser/Black1").set_opacity(1);

	if (counter > 7):
		scene.get_node("Eraser/Black2").set_opacity(1);
		
	if (counter > 8):
		scene.get_node("Eraser/Black3").set_opacity(1);
		
	if (counter > 8.5):
		scene.get_node("Eraser/Black4").set_opacity(1);
		
	if (counter > 9):
		scene.get_node("Eraser/Black5").set_opacity(1);

func print1():
	text.add_text("Nothing to erase");
	
func print2():
	counterMax = 120;
	text.add_text("Erasing memories...");
	rolly.canMove = false;