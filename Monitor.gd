extends Interactable

onready var textLabel = $Label3D
export var text = ""
export onready var backgroundColorMesh = $CSGMesh
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
func turnOnMonitor(MonitorStatus: bool):
	#turnedOn = !turnedOn
	print(MonitorStatus)
	#show the
	if MonitorStatus:
		backgroundColorMesh.show()
		textLabel.show()
	else:
		backgroundColorMesh.hide()
		textLabel.hide()

#for setting the text on the monitors
func setMonitorText(incoming: String):
	text.set_text(incoming)
