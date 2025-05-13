#extends CharacterBody3D
#
#const SPEED = 4.0
#const JUMP_VELOCITY = 4.5
#const MOUSE_SENSITIVITY = 0.003
#
#@onready var neck = $Neck
#@onready var camera = $Neck/Camera3D
#
#var rotation_x = 0.0
#
#func _ready():
	#Input.set_mouse_mode(Input.MOUSE_MODE_CAPTURED)

#func _unhandled_input(event):
#	if event is InputEventMouseMotion:
#		# Rotación horizontal del jugador (eje Y)
#		rotation.y -= event.relative.x * MOUSE_SENSITIVITY

#		# Rotación vertical de la cámara (eje X)
#		rotation_x -= event.relative.y * MOUSE_SENSITIVITY
#		rotation_x = clamp(rotation_x, deg_to_rad(-90), deg_to_rad(90))
#		neck.rotation.x = rotation_x

#func _physics_process(delta):
#	var direction = Vector3.ZERO
#	var forward = -transform.basis.z
#	var right = transform.basis.x

#	if Input.is_action_pressed("ui_up"):
#		direction += forward
	#if Input.is_action_pressed("ui_down"):
		#direction -= forward
	#if Input.is_action_pressed("ui_left"):
		#direction -= right
	#if Input.is_action_pressed("ui_right"):
		#direction += right
#
	#if direction != Vector3.ZERO:
		#direction = direction.normalized()
		#velocity.x = direction.x * SPEED
		#velocity.z = direction.z * SPEED
	#else:
		#velocity.x = move_toward(velocity.x, 0, SPEED)
		#velocity.z = move_toward(velocity.z, 0, SPEED)
#
	## Saltar
	#if Input.is_action_just_pressed("ui_accept") and is_on_floor():
		#velocity.y = JUMP_VELOCITY
#
	## Gravedad
	#if not is_on_floor():
		#velocity.y -= 9.8 * delta
#
	#move_and_slide()
