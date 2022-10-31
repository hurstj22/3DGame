extends Node

onready var bombsoundnode = get_node("/root/Main/Bomb/BombSound")
onready var congratssound = get_node("/root/Main/CongratsMusic")

func _on_Player_victory():
	$BackgroundMusic.stop()
	$CongratsMusic.play()
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
	$BackgroundMusic.stop()
	bombsoundnode.play()
	var t = Timer.new()
	t.set_wait_time(4.3)
	t.set_one_shot(true)
	self.add_child(t)
	t.start()
	yield(t, "timeout")
	$UI/BombLoseScreen.show()
	$UI/BombLoseMessage.show()
