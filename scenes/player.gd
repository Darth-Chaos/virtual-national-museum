extends CharacterBody3D


const SPEED = 5.0
const JUMP_VELOCITY = 4.5

@onready var neck := $Neck
@onready var camera := $Neck/Camera3D
@onready var root := $".."
@onready var footsteps := $Steps1


func _unhandled_input(event: InputEvent) -> void:
	if !root.paused:
		if event is InputEventMouseMotion:
			Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

		if Input.get_mouse_mode() == Input.MOUSE_MODE_CAPTURED:
			if event is InputEventMouseMotion:
				neck.rotate_y(-event.relative.x * 0.01)
				camera.rotate_x(-event.relative.y * 0.01)
				camera.rotation.x = clamp(camera.rotation.x, deg_to_rad(-30), deg_to_rad(60))
	else:
		Input.set_mouse_mode(Input.MOUSE_MODE_VISIBLE)


func _physics_process(delta: float) -> void:
	# Add the gravity.
	if not is_on_floor():
		velocity += get_gravity() * delta

	# Handle jump.
	if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		velocity.y = JUMP_VELOCITY

	# Get the input direction and handle the movement/deceleration.
	# As good practice, you should replace UI actions with custom gameplay actions.
	var input_dir := Input.get_vector("move_left", "move_right", "move_forward", "move_backward")
	var direction = (neck.transform.basis * Vector3(input_dir.x, 0, input_dir.y)).normalized()
	var horizontal_velocity = Vector3(velocity.x, 0, velocity.z).length()
	
	if is_on_floor() && horizontal_velocity > 0:
		if not footsteps.playing:
			footsteps.pitch_scale = randf_range(0.9, 1.1)
			footsteps.play()
	else:
		footsteps.stop()

	if direction:
		velocity.x = direction.x * SPEED
		velocity.z = direction.z * SPEED
	else:
		velocity.x = move_toward(velocity.x, 0, SPEED)
		velocity.z = move_toward(velocity.z, 0, SPEED)

	move_and_slide()
