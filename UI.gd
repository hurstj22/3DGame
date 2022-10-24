extends Control



func _on_Door_win_condition():
	$WinLabel.show()
	yield(get_tree().create_timer(4.0), "timeout")
	get_tree().quit()
