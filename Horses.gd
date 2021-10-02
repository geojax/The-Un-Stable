extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"

var horseTimer
var Fireworks

# Called when the node enters the scene tree for the first time.
func _ready():
	Fireworks = get_node("../Fireworks")
	Fireworks.connect("success", self, "_on_Fireworks_succeed")
	horseTimer = Timer.new()
	horseTimer.set_wait_time(5)
	horseTimer.set_one_shot(true)
	horseTimer.connect("timeout", self, "_no_time")
	add_child(horseTimer)
	horseTimer.start()
	pass # Replace with function body.

func _on_Fireworks_succeed():
	horseTimer.start(5)
	pass

func _no_time():
	print("fail")
	pass

