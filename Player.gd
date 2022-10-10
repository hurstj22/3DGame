extends KinematicBody

#Properties for the character
export var speed = 14.0
export var jump_impulse = 20.0

var gravity = -75.0
var max_gravity = -150
var velocity = Vector3.ZERO
var acceleration = 16
var cam_sensitivity = 0.01
# Get the gravity from the project settings to be synced with RigidDynamicBody nodes.
#var gravity: float = ProjectSettings.get_setting("physics/3d/default_gravity")
onready var neck := $Neck
onready var camera := $Neck/Camera

func _unhandled_input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)
	elif event.is_action_pressed("ui_cancel"):
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)
	if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
		if event is InputEventMouseMotion: #move and rotate the camera relative to the mouse
			neck.rotate_y(-event.relative.x * cam_sensitivity) #in radians
			camera.rotate_x(-event.relative.y * cam_sensitivity)
			#limit the camera, otherwise the neck will rotate backwards and upside down
			camera.rotation.x = clamp(camera.rotation.x, deg2rad(-30), deg2rad(60))


func _physics_process(delta: float) -> void:
	var direction = Vector3.ZERO

	# Get the input direction and handle the movement/deceleration.
	if Input.is_action_pressed("right"):
		direction.x -= 1
	if Input.is_action_pressed("left"):
		direction.x += 1
	if Input.is_action_pressed("back"):
		direction.z -= 1
	if Input.is_action_pressed("forward"):
		direction.z += 1
	
	# Handle Jump.
	if Input.is_action_pressed("jump") and is_on_floor():
		velocity.y += jump_impulse

	if direction != Vector3.ZERO:
		direction = direction.normalized()
		#$Neck.look_at(translation + direction, Vector3.UP)
	
	#calc what the game thinks is forwards based on the neck
	#direction = (neck.transform.basis * Vector3(direction.x, 0, direction.y)).normalized()
	
	velocity.x = lerp(velocity.x, direction.x*speed, acceleration*delta)
	velocity.z = lerp(velocity.z, direction.z*speed, acceleration*delta)
	
	#add gravity
	velocity.y += gravity * delta
	if velocity.y < max_gravity:
		velocity.y = max_gravity

	velocity = move_and_slide(velocity, Vector3.UP)
	
	if is_on_floor() and velocity.y < 0:
		velocity.y = 0 #don't keep accelerating down when on flat ground
