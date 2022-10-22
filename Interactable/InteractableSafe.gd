extends Interactable

signal giveContentsToPlayer

export var safe : NodePath
export var locked = true
export var code = "1234"
export var empty = false

onready var safe_node = get_node(safe)

func _ready():
	pass

func get_interaction_text():
	if locked:
		return "Enter safe code"
	elif !empty:
		return "Take key" 
	else:
		return ""
	


func interact():
	if locked:
		locked = false #for now just unlock
	
	elif !empty:
		emit_signal("giveContentsToPlayer") #tell the player to get the key
		empty = true
		

