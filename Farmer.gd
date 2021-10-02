extends Area2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var speed = 5
var canMoveVert = false
onready var ladderArea := get_node("../Ladder")
onready var lowerBound = position.y
#var groundArea : Area2D
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	
	#input
	if Input.is_action_pressed("right"):
		position.x += speed
		pass
	if Input.is_action_pressed("left"):
		position.x -= speed
	if canMoveVert and Input.is_action_pressed("up") and position.y > 100:
		position.y -= speed / 2
	if canMoveVert and Input.is_action_pressed("down"):
		position.y += speed
		
	#bounds
	position.x = clamp(position.x, 40, 988)
	position.y = clamp(position.y, 100, lowerBound)
	pass

#func _physics_process(delta):
#	if self.


func _on_KinematicBody2D2_area_entered(area):
	if area == ladderArea:
		canMoveVert = true
	pass # Replace with function body.


func _on_Farmer_area_exited(area):
	if area == ladderArea:
		canMoveVert = false
	
	pass # Replace with function body.
