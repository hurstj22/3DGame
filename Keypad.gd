extends Control

signal correct_password
signal incorrect_password

const PASSWORD = "111"

onready var label = $VBoxContainer/MarginContainer/Label


func key_press(digit):
	if len(label.text) < 7:
		label.text += str(digit)

func _on_Button_pressed():
	key_press(1)


func _on_Button2_pressed():
	key_press(2)


func _on_Button3_pressed():
	key_press(3)


func _on_Button4_pressed():
	key_press(4)


func _on_Button5_pressed():
	key_press(5)


func _on_Button6_pressed():
	key_press(6)


func _on_Button7_pressed():
	key_press(7)

func _on_Button8_pressed():
	key_press(8)


func _on_Button9_pressed():
	key_press(9)


func _on_ButtonC_pressed():
	label.text = ""


func _on_Button0_pressed():
	key_press(0)

func _on_ButtonOK_pressed():
	if label.text == PASSWORD:
		print("CORRECT PASSWORD!")
		emit_signal("correct_password")
		#$ColorRect.instance().set_frame_color(1,1,1,1)
	else:
		print("INCORRECT PASSWORD")
		label.text = ""
		emit_signal("incorrect_password")
	
	
