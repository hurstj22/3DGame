extends Interactable

signal giveContentsToPlayer

export var safe : NodePath
export var locked = true
export var code = "1234"
export var empty = false
onready var keypad = get_node("/root/Main/UI/Keypad")

#onready var safe_node = get_node(safe)

func _ready():
	pass

func get_interaction_text():
	if locked:
		return "enter the safe code"
	elif !empty:
		return "take key" 
	else:
		return ""
	


func interact():
	if locked:
		#keypad code goes here
		keypad.show()
		get_tree().paused = true
		#locked = false #for now just unlock
		#needs to load the safe screen and allow the player to enter a code
		#if the code succeeds set locked to false otherwise keep it true
	
	elif !empty:
		emit_signal("giveContentsToPlayer") #tell the player to get the key
		empty = true
		

#unlock safe and hide the keypad
func _on_Keypad_correct_password():
	locked = false
	keypad.hide()
	get_tree().paused = false
	$AnimationPlayer.play("open")

#keep safe locked, just hide the keypad
func _on_Keypad_incorrect_password():
	keypad.hide()
	get_tree().paused = false
