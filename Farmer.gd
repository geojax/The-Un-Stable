extends Area2D

var speed = 5
var canMoveVert = false
var gravityOn = false
var lifeChanged = false
const GRAVITY = 10
onready var ladderArea := get_node("../Ladder")
onready var platformArea := get_node("../Platform")
onready var upperBound = position.y
onready var lives = get_node("../Lives")
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	#input
	if Input.is_action_pressed("right") and (position.y == upperBound or position.y == 100):
		position.x += speed
		pass
	if Input.is_action_pressed("left") and (position.y == upperBound or position.y == 100):
		position.x -= speed
		
	if canMoveVert and Input.is_action_pressed("up") and position.y > 100:
		position.y -= speed / 2
	if canMoveVert and Input.is_action_pressed("down"):
		position.y += speed / 2
		
	if ((not canMoveVert) and gravityOn):
		position.y += GRAVITY
		if (position.y <= upperBound):
			position.x -= 2
		if (lifeChanged == false):
			lives.changeLives(lives.totalLives - 1)
			lifeChanged = true
	#bounds
	position.x = clamp(position.x, 40, 988)
	position.y = clamp(position.y, 100, upperBound)
	
	pass

#func _physics_process(delta):
#	if self.

func _on_KinematicBody2D2_area_entered(area):
	if area == ladderArea:
		canMoveVert = true
	if area == platformArea:
		gravityOn = false
		lifeChanged = false
	pass # Replace with function body.


func _on_Farmer_area_exited(area):
	if area == ladderArea:
		canMoveVert = false
	if area == platformArea:
		gravityOn = true
	pass # Replace with function body.

