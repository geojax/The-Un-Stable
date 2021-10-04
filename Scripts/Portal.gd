extends "Interactible.gd"

const MAX_STABILITY = 5
const COOLDOWN = 10
var stability := 4.9
var portalProgress
var onCooldown = false
onready var animSprite := get_node("AnimatedSprite")
var portalTimer

func _ready():
#	portalProgress = get_node("PortalProgress")	
	typingGame.connect("success", self, "stabilizeMore")
	#typingGame.connect("failure", self, "_on_TypingGame_fail")
	portalTimer = Timer.new()
	portalTimer.set_one_shot(true)
	portalTimer.connect("timeout", self, "_no_time")
	add_child(portalTimer)
	pass 
	
func stabilizeMore():
	if not onCooldown:
		stability += 1
	print("stabilizing")
	if stability >= MAX_STABILITY:
		stability = 0
		portalTimer.start(COOLDOWN)
		onCooldown = true
		
	print($PortalProgress.value)
		
func _on_TypingGame_fail():
	stability = 0
	pass
	
func _no_time():
	onCooldown = false
	
	
func _process(delta):
	if stability > 0 and (not onCooldown):
		stability -= delta * .05
	if onCooldown:
		$AnimationPlayer.play("Cooldown")
	$PortalProgress.value = (float(stability) / MAX_STABILITY) * 100
	if not onCooldown:
		animSprite.speed_scale = 6 - stability
	else:
		animSprite.speed_scale = 0.25
	pass


