extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
onready var typingGame := get_node("TypingGame")

# Called when the node enters the scene tree for the first time.
func _ready():
	$Area2D.connect("area_entered", self, "_on_Area2D_area_entered")
	$Area2D.connect("area_exited", self, "_on_Area2D_area_exited")
	typingGame.visible = false
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Area2D_area_entered(area):
	typingGame.resetGame()
	$TypingGame/LineEdit.grab_focus()
	typingGame.visible = true
	pass # Replace with function body.


func _on_Area2D_area_exited(area):
	typingGame.visible = false
	pass # Replace with function body.
