extends Interactable


#signal giveContentsToPlayer

export var locked = false
export var empty = false
export var open = false

func _ready():
	pass

func get_interaction_text():
	if !open and !locked:
		return "Click to open the locker"
	elif !open and locked:
		return "The locker is locked"
	elif open:
		return "Click to close the locker"
	

func interact():
	if !open and !locked:
		$AnimationPlayer.play("open")
		open = true
	elif open:
		$AnimationPlayer.play("close")
		open = false

