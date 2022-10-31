extends Interactable

signal win_condition

export var door : NodePath
export var isOpen = false
export var locked = true

#onready var door_node = get_node("res://DoorAttempt2.tscn")

func _ready():
	pass

func get_interaction_text():
	if !isOpen and !locked:
		return "Click to open the door"
	elif !isOpen and locked:
		return "The door is locked"
	elif isOpen:
		return "Click to close the door"
	

func interact():
	if !isOpen and !locked:
		$AnimationPlayer.play("DoorOpen")
		isOpen = true
		emit_signal("win_condition") #for now always win once the player opens the door
	elif isOpen:
		$AnimationPlayer.play("DoorClose")
		isOpen = false
			

#unlock the door as soon as the player has the key
func _on_Safe_giveContentsToPlayer():
	locked = false
