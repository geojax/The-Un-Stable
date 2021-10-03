extends "Interactible.gd"

var portalTime := 15
var portalTimer
var isStable := false
var successes := 0
var portalProgress

func _ready():
#	portalProgress = get_node("PortalProgress")
	portalTimer = Timer.new()
	portalTimer.set_one_shot(true)
	portalTimer.connect("timeout", self, "_no_time")
	add_child(portalTimer)
	portalTimer.start(portalTime)
	pass 
	
func _on_TypingGame_succeed():
	successes += 1
	if successes == 3:
		isStable = true
		portalTimer.start(portalTime)
		successes = 0 
		$AnimationPlayer.stop()
		$AnimatedSprite.scale = Vector2(0.414, 0.414)
		
func _on_TypingGame_fail():
	successes = 0
	portalTimer.start(portalTimer.time_left * 0.5)
	pass
	
func _no_time():
	isStable = false
	$AnimationPlayer.play("Failure")
	pass
	
func _process(delta):
	$PortalProgress.value = portalTimer.time_left / portalTime * 100
	pass


