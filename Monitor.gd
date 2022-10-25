extends Interactable

export onready var text = $Label3D
export onready var backgroundColorMesh = $CSGMesh
export var turnedOn = false

func _ready():
	pass

func get_interaction_text():
	if !turnedOn:
		turnedOn = true
		return "Turn on monitor"
	elif turnedOn:
		turnedOn = false
		return "Turn off monitor"

func interact():
	turnOnMonitor(turnedOn)
	

#Toggle the monitors
func turnOnMonitor(turnedOn: bool):
	#turnedOn = !turnedOn
	print(turnedOn)
	#show the
	if turnedOn:
		backgroundColorMesh.show()
		text.show()
	else:
		backgroundColorMesh.hide()
		text.hide()

#for setting the text on the monitors
func setMonitorText(incoming: String):
	text.set_text(incoming)
