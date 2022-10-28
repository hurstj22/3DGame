extends Node


func _on_Player_victory():
	$UI/VictoryScreen.show()
	$UI/VictoryMessage.show()
	$Player/Camera/Crosshair.hide()


func _ready():
	if Global.nuxMode:
		$UI/NuxModeClue.show()
	else:
		$UI/NuxModeClue.hide()
