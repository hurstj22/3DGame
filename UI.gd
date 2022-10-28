extends Control

var escPressed = false

func _unhandled_input(event):
	if event.is_action_pressed("ui_cancel") and !escPressed:
		$QuitButton.show()
		$ResumeButton.show()
		escPressed = true
		get_tree().paused = true;
		
	#second time pressing esc so close the menu
	elif event.is_action_pressed("ui_cancel") and escPressed:
		$QuitButton.hide()
		$ResumeButton.hide()
		escPressed = false
		get_tree().paused = false;


func _on_QuitButton_pressed():
	get_tree().quit()


func _on_ResumeButton_pressed():
		$QuitButton.hide()
		$ResumeButton.hide()
		escPressed = false
		get_tree().paused = false;
