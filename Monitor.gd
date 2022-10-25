extends Interactable

onready var textLabel = $Label3D
export var text = ""
export onready var backgroundColorMesh = $CSGMesh
onready var light = $OmniLight
export var turnedOn = false

func _ready():
	$Label3D.set_text(text)

func get_interaction_text():
	if !turnedOn:
		return "Turn on monitor"
	elif turnedOn:
		return "Turn off monitor"

func interact():
	turnedOn = !turnedOn
	turnOnMonitor(turnedOn)

#Toggle the monitors
func turnOnMonitor(turnedOn: bool):
	#turnedOn = !turnedOn
	print(turnedOn)
	#show the
	if turnedOn:
		backgroundColorMesh.show()
		textLabel.show()
		light.show()
	else:
		backgroundColorMesh.hide()
		textLabel.hide()
		light.hide()

#for setting the text on the monitors
func setMonitorText(incoming: String):
	text.set_text(incoming)
