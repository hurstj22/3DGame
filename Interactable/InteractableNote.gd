extends Interactable

onready var noteScreen = get_node("/root/Main/UI/LockerNoteScreen")
onready var noteMessage = get_node("/root/Main/UI/LockerNoteMessage")
	
	
func get_interaction_text():
	return "read note"
	
func interact():
	noteScreen.show()
	noteMessage.show()
	

