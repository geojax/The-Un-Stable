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
	successes += 1
	if (successes == 3):
		horseTimer.start(horseTime)
		successes = 0
	pass

func _no_time():
	print("fail")
	pass
	
func _process(delta):
	$Sprite.scale = ((horseTime-horseTimer.time_left)*Vector2.ONE*0.025)
	$Sprite.modulate.a8= int((horseTime- horseTimer.time_left) / horseTime*255)
	#$Sprite.position.x = ((horseTime-horseTimer.time_left)*50) + 100
	pass

