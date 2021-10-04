extends Node2D


var horseTimer
var Fireworks
const HORSE_TIME := 20
const MAX_SPRITE_SIZE = .2
var successes := 0;
onready var fireworksSprite : Sprite 
onready var fwSprites = [load("res://Art/FireworksEmpty.png"), load("res://Art/Fireworks1.png"),
load("res://Art/Fireworks - Copy.png"), load("res://Art/Fireworks.png")]
func _ready():
	Fireworks = get_node("../Fireworks")
	fireworksSprite = Fireworks.get_node("Sprite")
	Fireworks.connect("success", self, "_on_Fireworks_succeed")
	horseTimer = Timer.new()
	horseTimer.set_wait_time(HORSE_TIME)
	horseTimer.set_one_shot(true)
	horseTimer.connect("timeout", self, "_no_time")
	add_child(horseTimer)
	horseTimer.start()
	
	$gallopSound.play()
	pass 

func _on_Fireworks_succeed():
	successes += 1
	if (successes % 4 == 0):
		horseTimer.start(HORSE_TIME)
		#successes = 0
		$AudioStreamPlayer2D.play()
		Fireworks.get_node("AnimationPlayer").play("Firework")
		$whinnieSound.play()
	
	fireworksSprite.texture = fwSprites[successes % 4]
	pass

func _no_time():
	get_tree().change_scene("res://Scenes/Death.tscn")
	pass
	
func _process(delta):
	$Sprite.scale = (HORSE_TIME - horseTimer.time_left) / HORSE_TIME * MAX_SPRITE_SIZE * Vector2.ONE
	if horseTimer.time_left <= 10:
		$AnimatedSprite.visible = true
	else:
		$AnimatedSprite.visible = false
	pass
	
	$gallopSound.volume_db = (HORSE_TIME - horseTimer.time_left) / HORSE_TIME * 60 - 60

