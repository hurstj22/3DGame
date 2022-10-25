extends Node

func _on_Player_victory():
	$UI/VictoryScreen.show()
	$UI/VictoryMessage.show()
	$Player/Camera/Crosshair.hide()

func _unhandled_input(event):
	if event.is_action_pressed("ui_accept") and $UI/VictoryScreen.visible:
		get_tree().reload_current_scene()
	
	if event.is_action_pressed("1") and $UI/Keypad.visible:
		print("heard 1")
		$UI/Keypad.key_press(1)
