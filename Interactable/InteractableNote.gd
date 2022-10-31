extends Interactable

onready var noteScreen = get_node("/root/Main/UI/LockerNoteScreen")
onready var noteMessage = get_node("/root/Main/UI/LockerNoteMessage")
onready var paperSound = get_node("/root/Locker_Interactable/PaperSound")
	
func get_interaction_text():
	return "read note"
	
func interact():
	$PaperSound.play()
	noteScreen.show()
	noteMessage.show()
	
	

