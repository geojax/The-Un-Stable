extends Node2D


var horseTimer
var Fireworks


func _ready():
	Fireworks = get_node("../Fireworks")
	Fireworks.connect("success", self, "_on_Fireworks_succeed")
	horseTimer = Timer.new()
	horseTimer.set_wait_time(5)
	horseTimer.set_one_shot(true)
	horseTimer.connect("timeout", self, "_no_time")
	add_child(horseTimer)
	horseTimer.start()
	pass 

func _on_Fireworks_succeed():
	horseTimer.start(5)
	pass

func _no_time():
	print("fail")
	pass

