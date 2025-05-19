extends Node

@onready var pause_menu = $PauseMenu
@onready var option_menu = $option
@onready var acces_menu = $Accesibilidad
@onready var menu_principal = $MenuPrincipal
@onready var color_filter = $PauseMenu/ColorRect

var paused = false


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta: float) -> void:
	if Input.is_action_just_pressed("ui_cancel"):
		pauseMenu()


func pauseMenu():
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
	pause_menu.show()


func _on_button_inicio_pressed() -> void:
	menu_principal.hide()
	get_tree().paused = false
	Input.mouse_mode = Input.MOUSE_MODE_CAPTURED
	
