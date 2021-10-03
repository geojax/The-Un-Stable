extends Node2D


var horseTimer
var Fireworks
const HORSE_TIME := 20
const MAX_SPRITE_SIZE = .2
var successes := 0;

func _ready():
	Fireworks = get_node("../Fireworks")
	Fireworks.connect("success", self, "_on_Fireworks_succeed")
	horseTimer = Timer.new()
	horseTimer.set_wait_time(HORSE_TIME)
	horseTimer.set_one_shot(true)
	horseTimer.connect("timeout", self, "_no_time")
	add_child(horseTimer)
	horseTimer.start()
	pass 

func _on_Fireworks_succeed():
	successes += 1
	if (successes == 3):
		horseTimer.start(HORSE_TIME)
		successes = 0
	pass

func _no_time():
	print("fail")
	pass
	
func _process(delta):
	$Sprite.scale = (HORSE_TIME - horseTimer.time_left) / HORSE_TIME * MAX_SPRITE_SIZE * Vector2.ONE
	pass

