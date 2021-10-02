extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var numLives = 3
var numMedbaySuccesses = 0
onready var lives = get_node("Lives")
# Called when the node enters the scene tree for the first time.
func _ready():
	randomize()
	$Fireworks.connect("failure", self, "_on_Fireworks_fail")
	$Medbay.connect("success", self, "_on_Medbay_success")
	$Medbay.connect("failure", self, "_on_Medbay_fail")
	pass # Replace with function body.

func _process(delta):
	if numLives == 3:
		$MedbayProgress.value = 100
	else:
		$MedbayProgress.value = 0

func _on_Fireworks_fail():
	numLives -= 1
	lives.changeLives(numLives)
	if numLives <= 0:
		print("Dead")
	pass
	
func _on_Medbay_success():
	if numLives < 3:
		numMedbaySuccesses += 1
		if numMedbaySuccesses >= 3:
			numLives += 1
			numMedbaySuccesses = 0
		lives.changeLives(numLives)
		$MedbayProgress.value = float(numMedbaySuccesses) / 3 * 100
	pass
	
func _on_Medbay_fail():
	numMedbaySuccesses = 0
	$MedbayProgress.value = 0
	pass
# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
