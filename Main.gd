extends Node


func _on_Player_victory():
	$UI/VictoryScreen.show()
	$UI/VictoryMessage.show()
	$Player/Camera/Crosshair.hide()
	
func _unhandled_input(event):
	if event.is_action_pressed("ui_accept") and $UI/VictoryScreen.visible:
		get_tree().change_scene("res://TitleScreen.tscn")
		
	# handle keypad inputs here?


func _ready():
	if Global.nuxMode:
		$UI/NuxModeClue.show()
	else:
		$UI/NuxModeClue.hide()
