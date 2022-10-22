extends RayCast

var current_collider

onready var interaction_label = get_node("/root/Main/UI/InteractionLabel")


func _ready():
	set_interaction_text("")

func _process(delta):
	var collider = get_collider()
	
	#hitting an object that is marked with the interactable script
	if is_colliding() and collider is Interactable:
		#colliding with a new object that is interactable
		if current_collider != collider:
			set_interaction_text(collider.get_interaction_text())
			current_collider = collider
		
		if Input.is_action_just_pressed("Interact"):
			collider.interact()
			#once your done interacting, set the interaction text again in case
			#the text needs to be updated based on if it just was true
			set_interaction_text(collider.get_interaction_text())
		
	elif current_collider:
		current_collider = null
		set_interaction_text("")

func set_interaction_text(text):
	if !text:
		interaction_label.set_text("")
		interaction_label.set_visible(false)
	else:
		#pass in whatever the interaction will do
		interaction_label.set_text("Click to %s" % text)
		interaction_label.set_visible(true)
