extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

onready var hearts = get_children()
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func changeLives(newNum):
	for i in range(0, 3):
		if i < newNum:
			hearts[i].visible = true
		else:
			hearts[i].visible = false
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
