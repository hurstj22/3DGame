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
		return "Click to enter the safe code"
	elif !empty:
		return "Click to take key" 
	else:
		return ""
	


func interact():
	if locked:
		#keypad code goes here
		keypad.show()
		get_tree().paused = true
	
	elif !empty:
		emit_signal("giveContentsToPlayer") #tell the player to get the key
		$key.hide()
		empty = true
		

#unlock safe and hide the keypad
func _on_Keypad_correct_password():
	locked = false
	$AnimationPlayer.play("open")
	keypad.hide()
	get_tree().paused = false

#keep safe locked, just hide the keypad
func _on_Keypad_incorrect_password():
	keypad.hide()
	get_tree().paused = false
