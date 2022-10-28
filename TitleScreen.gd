extends Control


# Called when the node enters the scene tree for the first time.
func _ready():
	yield(get_tree().create_timer(1), "timeout")
	$AnimationPlayer.play("BlackFade")
	yield(get_tree().create_timer(2), "timeout")
	$HBoxContainer/PlayButton.show()
	$HBoxContainer/HelpButton.show()
	$HBoxContainer/QuitButton.show()
	$HBoxContainer/PlayWithNux.show()
	

func _on_PlayButton_pressed():
	get_tree().change_scene("res://Main.tscn")
	Global.nuxMode = false


func _on_HelpButton_pressed():
	get_tree().change_scene("res://Help.tscn")


func _on_QuitButton_pressed():
	get_tree().quit()


func _on_PlayWithNux_pressed():
	get_tree().change_scene("res://Main.tscn")
	Global.nuxMode = true
