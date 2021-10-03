extends Node2D

# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var totalLives := 3
onready var hearts = get_children()


func _ready():
	pass # Replace with function body.

func changeLives(newNum):
	for i in range(0, 3):
		if i < newNum:
			hearts[i].visible = true
		else:
			hearts[i].visible = false
	totalLives = newNum
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
