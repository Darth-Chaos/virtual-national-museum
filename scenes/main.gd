extends Node

@onready var pause_menu = $PauseMenu
@onready var option_menu = $option
@onready var acces_menu = $Accesibilidad
@onready var menu_principal = $MenuPrincipal
@onready var color_filter = $PauseMenu/ColorRect


var paused = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	menu_principal.show()
	Engine.time_scale = 0
	Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	
# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		pauseMenu()


func pauseMenu():
	# Si el menú principal está visible, no permitir pausa
	if $MenuPrincipal.visible:
		return
		
	paused = not paused

	if paused:
		pause_menu.show()
		Engine.time_scale = 0
		Input.mouse_mode = Input.MOUSE_MODE_VISIBLE
	else:
		pause_menu.hide()
		Engine.time_scale = 1
		Input.mouse_mode = Input.MOUSE_MODE_CAPTURED


func _on_button_pressed() -> void:
	pass # Replace with function body.


func _on_quit_pressed():
	get_tree().quit()

#func hide_all_menus():
#	pause_menu.hide()
#	option_menu.hide()

#func _on_option_pressed():
	#pass
#	hide_all_menus()
#	option_menu.show()


func _on_brillo_slider_value_changed(value: float) -> void:
	Globalsettings.set_brightness(value)


func _on_slider_master_vol_value_changed(value: float) -> void:
	Globalsettings.update_master_vol(0, value)

func _on_slider_music_vol_value_changed(value: float) -> void:
	Globalsettings.update_master_vol(1, value)

func _on_slider_sfx_vol_value_changed(value: float) -> void:
	Globalsettings.update_master_vol(2, value)

func _on_option_button_pressed():
	pause_menu.hide()
	option_menu.show()

func _on_continue_pressed():
	pauseMenu() # Replace with function body.

func _on_regresar_pressed() -> void:
	option_menu.hide()
	pause_menu.show()


func _on_button_accesibilidad_pressed() -> void:
	option_menu.hide()
	acces_menu.show()


func _on_button_regresar_menu_pressed() -> void:
	acces_menu.hide()
	option_menu.show()


func _on_button_inicio_pressed() -> void:
	menu_principal.hide()
	Engine.time_scale = 1
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED

func _on_option_prin_button_pressed() -> void:
	menu_principal.hide()
	option_menu.show()
	
func _set_modo_daltonismo(tipo: String):
	var color_fondo : Color
	
	match tipo:
		"normal":
			color_fondo = Color(1, 1, 1)
		"protanopia":
			color_fondo = Color(0.8, 0.8, 1.0)
		"deuteranopia":
			color_fondo = Color(0.6, 0.8, 1.0)
		"tritanopia":
			color_fondo = Color(1.0, 0.7, 0.7)
		_:
			color_fondo = Color(1, 1, 1)
	
	var cam = $Camera
	if cam and cam.environment:
		cam.environment.background_color = color_fondo
	else:
		print("La cámara no tiene environment asignado o no existe")
	
	# Cambiar color materiales grupo "daltonismo"
	for node in get_tree().get_nodes_in_group("daltonismo"):
		if node is MeshInstance3D:
			for i in range(node.get_surface_count()):
				var mat = node.get_active_material(i)
				if mat:
					var mat_dup = mat.duplicate()
					mat_dup.albedo_color = color_fondo
					node.set_surface_override_material(i, mat_dup)

func _on_daltonismo_button_item_selected(index: int) -> void:
	match index:
		0:
			_set_modo_daltonismo("normal")
		1:
			_set_modo_daltonismo("protanopia")
		2:
			_set_modo_daltonismo("deuteranopia")
		3:
			_set_modo_daltonismo("tritanopia")
