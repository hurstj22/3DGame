extends Interactable

signal bomb_kill


func get_interaction_text():
	return "Click to interact with bomb"
	
func interact():
	emit_signal("bomb_kill")
