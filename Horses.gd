extends Node2D


var horseTimer
var Fireworks
var horseTime := 5;
var successes := 0;

func _ready():
	Fireworks = get_node("../Fireworks")
	Fireworks.connect("success", self, "_on_Fireworks_succeed")
	horseTimer = Timer.new()
	horseTimer.set_wait_time(horseTime)
	horseTimer.set_one_shot(true)
	horseTimer.connect("timeout", self, "_no_time")
	add_child(horseTimer)
	horseTimer.start()
	pass 

func _on_Fireworks_succeed():
	#successes ++1
	horseTimer.start(horseTime)
	pass

func _no_time():
	print("fail")
	pass
	
func _process(delta):
	$Sprite.position.x = ((horseTime-horseTimer.time_left)*50) + 100
	pass

