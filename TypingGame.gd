extends Node2D


# Declare member variables here. Examples:
# var a = 2
# var b = "text"
var code := String()
var progress := 0
var viableChars := ["Z", "X", "C", "V"]
# Called when the node enters the scene tree for the first time.
func _ready():
	#$LineEdit.grab_focus()
	for c in viableChars:
		code += viableChars[rand_range(0, 4)]
	$Label.text = code
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass

func _on_LineEdit_text_changed(new_text):
	new_text = new_text.to_upper()
	if new_text != code.substr(0, len(new_text)):
		$AnimationPlayer.play("Failure")
		pass
	$Label2.text += code[progress]
	if progress < 3:
		progress += 1
	pass # Replace with function body.


func _on_AnimationPlayer_animation_finished(anim_name):
	queue_free()
	pass # Replace with function body.
