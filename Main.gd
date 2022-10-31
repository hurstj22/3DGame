extends Node


func _on_Player_victory():
	$UI/VictoryScreen.show()
	$UI/VictoryMessage.show()
	$Player/Camera/Crosshair.hide()
	
func _unhandled_input(event):
	if event.is_action_pressed("ui_accept"):
		$UI/LockerNoteMessage.hide()
		$UI/LockerNoteScreen.hide()
		if $UI/VictoryScreen.visible or $UI/BombLoseScreen.visible:
			get_tree().change_scene("res://TitleScreen.tscn")
		
	# handle keypad inputs here?


func _ready():
	if Global.nuxMode:
		$UI/NuxModeClue.show()
	else:
		$UI/NuxModeClue.hide()


func _on_Bomb_bomb_kill():
	$UI/BombLoseScreen.show()
	$UI/BombLoseMessage.show()
