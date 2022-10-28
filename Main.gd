extends Node

var escPressed = false

func _on_Player_victory():
	$UI/VictoryScreen.show()
	$UI/VictoryMessage.show()
	$Player/Camera/Crosshair.hide()


func _on_Button_pressed():
	get_tree().quit()


func _on_MenuButton_pressed():
	pass # Replace with function body.

func _process(delta):
	if Input.is_action_pressed("ui_cancel") and !escPressed:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
		$UI/QuitButton.show()
		$UI/MenuButton.show()
		$Player/Camera/Crosshair.hide()
		escPressed = true
	#second time pressing esc so close the menu
	elif Input.is_action_pressed("ui_cancel") and escPressed:
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
		$UI/QuitButton.hide()
		$UI/MenuButton.hide()
		$Player/Camera/Crosshair.show()
		escPressed = false
