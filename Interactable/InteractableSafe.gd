extends Interactable

signal giveContentsToPlayer

export var safe : NodePath
export var locked = true
export var code = "1234"
export var empty = false

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
		
		locked = false #for now just unlock
		#needs to load the safe screen and allow the player to enter a code
		#if the code succeeds set locked to false otherwise keep it true
	
	elif !empty:
		emit_signal("giveContentsToPlayer") #tell the player to get the key
		empty = true
		

