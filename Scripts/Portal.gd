extends "Interactible.gd"

const MAX_STABILITY = 5
var stability := 4.9
var portalProgress
onready var animSprite := get_node("AnimatedSprite")

func _ready():
#	portalProgress = get_node("PortalProgress")	
	typingGame.connect("success", self, "stabilizeMore")
	#typingGame.connect("failure", self, "_on_TypingGame_fail")
	pass 
	
func stabilizeMore():
	stability += 1
	print("stabilizing")
	if stability == 5:
		stability = 0 
	print($PortalProgress.value)
		
func _on_TypingGame_fail():
	stability = 0
	pass
	
func _process(delta):
	if stability > 0:
		stability -= delta * .1
		
	$PortalProgress.value = (float(stability) / MAX_STABILITY) * 100
	animSprite.speed_scale = 6 - stability
	pass


