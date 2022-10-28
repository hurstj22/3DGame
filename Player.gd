extends KinematicBody

signal victory

#Properties for the character
export var speed = 20.0
export var jump_impulse = 25.0
export var doorKey = false

#to display what the player has collected
onready var ItemsList = get_node("/root/Main/UI/ItemsListLabel")
var currentItemsList = "Items Collected: "

var gravity = -75.0
var max_gravity = -150
var velocity = Vector3.ZERO
var mouseDelta : Vector2 = Vector2()
var acceleration = 30
var cam_sensitivity = 0.01

# cam look
var minLookAngle : float = -50.0
var maxLookAngle : float = 110.0
var lookSensitivity : float = 50.0

onready var neck := $Neck
onready var camera := $Camera

func _process(delta):
	
# rotate the camera along the x axis
	camera.rotation_degrees.x -= mouseDelta.y * lookSensitivity * delta
#clamp camera x rotation axis
	camera.rotation_degrees.x = clamp(camera.rotation_degrees.x, minLookAngle, maxLookAngle)
# rotate the player along their y-axis
	rotation_degrees.y -= mouseDelta.x * lookSensitivity * delta
	#reset the mouseDelta vector
	mouseDelta = Vector2()

func _input(event):
	if event is InputEventMouseButton:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	elif event.is_action_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	elif event is InputEventMouseMotion:
		Input.set_mouse_mode(Input.MOUSE_MODE_HIDDEN)
		mouseDelta = event.relative

func _physics_process(delta: float) -> void:
	var direction = Vector3.ZERO
	velocity.x = 0
	velocity.z = 0
	
	# Get the input direction and handle the movement/deceleration.
	if Input.is_action_pressed("right"):
		direction.x += 1
	if Input.is_action_pressed("left"):
		direction.x -= 1
	if Input.is_action_pressed("back"):
		direction.y += 1
	if Input.is_action_pressed("forward"):
		direction.y -= 1
	
	# Handle Jump.
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y += jump_impulse

	if direction != Vector3.ZERO:
		direction = direction.normalized()
	
	var forward = global_transform.basis.z
	var right = global_transform.basis.x
	
	#print("forward " + str(forward))
	#print("right " + str(right))
	
	var relativeDir = (forward*direction.y + right*direction.x) #calc new relative dir
	#print(relativeDir)
	
	velocity.x = lerp(relativeDir.x, relativeDir.x*speed, acceleration*delta)
	velocity.z = lerp(relativeDir.z, relativeDir.z*speed, acceleration*delta)
	
	#add gravity
	velocity.y += gravity * delta
	if velocity.y < max_gravity:
		velocity.y = max_gravity

	velocity = move_and_slide(velocity, Vector3.UP)
	
	if is_on_floor() and velocity.y < 0:
		velocity.y = 0 #don't keep accelerating down when on flat ground


func _on_Safe_giveContentsToPlayer():
	doorKey = true
	collectItem("Key")

#adds an item to the player's UI List
func collectItem(item: String):
	currentItemsList += item + "\n"
	ItemsList.set_text(currentItemsList) #update the list
	

func win():
	emit_signal("victory")
	queue_free()

func _on_DoorEnteredDetector_body_entered(body):
	win()
