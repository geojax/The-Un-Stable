extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var code := String()
var progress := 0
var viableChars := ["Z", "X", "C", "V"]
onready var label1 = get_node("Label")
onready var label2 = get_node("Label2")
onready var label3 = get_node("Label3")
onready var lineEdit = get_node("LineEdit")

signal failure
signal success
# Called when the node enters the scene tree for the first time.

func resetGame():
	progress = 0
	lineEdit.clear()
	label2.text = String()
	code = String()
	for _c in range(0, 4):
		code += viableChars[rand_range(0, 4)]
	label1.text = code
	label3.text = code

func _ready():
	#$LineEdit.grab_focus()
	resetGame()
	label1.text = code
	label3.text = code
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_LineEdit_text_changed(new_text):
	if (new_text != ""):
		new_text = new_text.to_upper()
		#fail state
		if new_text != code.substr(0, len(new_text)):
			$AnimationPlayer.play("Failure")
			#animation calls resetGame()!
			emit_signal("failure")
			pass
		label2.text += code[progress]
		if progress < 3:
			progress += 1
			
	if progress == 3 and new_text == code:
		emit_signal("success")
		resetGame()
	pass # Replace with function body.

#
#func _on_AnimationPlayer_animation_finished(anim_name):
#	queue_free()
#	pass # Replace with function body.
