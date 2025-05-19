extends CanvasLayer

#audio option
@onready var BrilloSlider =  $"../Accesibilidad/MarginContainer/VBoxContainer/brightness/BrilloSlider"

#accesibilidad 
@onready var SliderMasterVol =  $"../option/MarginContainer/VBoxContainer/MasterVol/SliderMasterVol"
@onready var SliderMusicVol = $"../option/MarginContainer/VBoxContainer/MusicVol/SliderMusicVol"
@onready var SFXVol = $"../option/MarginContainer/VBoxContainer/SFXVol/SliderSFXVol"

#@onready var volume_slider = $MarginContainer/VBoxContainer/Sound/VolumeSlider
#@onready var color_filter = $ColorRect
@onready var root := $".."

var color_matrices := [
	# Normal (matriz identidad)
	[
		Vector3(1.0, 0.0, 0.0),
		Vector3(0.0, 1.0, 0.0),
		Vector3(0.0, 0.0, 1.0)
	],
	# Deuteranomalía (verde débil)
	[
		Vector3(0.8, 0.2, 0.0),
		Vector3(0.258, 0.742, 0.0),
		Vector3(0.0, 0.142, 0.858)
	],
	# Protanopía (rojo débil)
	[
		Vector3(0.567, 0.433, 0.0),
		Vector3(0.558, 0.442, 0.0),
		Vector3(0.0, 0.242, 0.758)
	],
	# Tritanopía (azul débil)
	[
		Vector3(0.95, 0.05, 0.0),
		Vector3(0.0, 0.433, 0.567),
		Vector3(0.0, 0.475, 0.525)
	]
]


#func _ready():
	#hide()
	#volume_slider.visible = false
	# Configura el slider para controlar el volumen principal
	#volume_slider.value = db_to_linear(
		#AudioServer.get_bus_volume_db(AudioServer.get_bus_index("Master"))
	#)

	#if color_filter.material == null:
	#	color_filter.material = ShaderMaterial.new()
	#	color_filter.material.shader = preload("res://assets/shaders/basic.gdshader")

	#var identity_matrix = [
	#	Vector3(1.0, 0.0, 0.0),
	#	Vector3(0.0, 1.0, 0.0),
	#	Vector3(0.0, 0.0, 1.0)
	#]
	#color_filter.material.set_shader_parameter("color_matrix", identity_matrix)


func _on_continue_pressed():
	root.pauseMenu()


#func _on_option_button_item_selected(index):
#	pass
	#if index >= 0 and index < color_matrices.size():
	#	color_filter.material.set_shader_parameter("color_matrix", color_matrices[index])


#func _on_volume_slider_value_changed(value):
	# Ajusta el volumen del bus "Master"
	#AudioServer.set_bus_volume_db(AudioServer.get_bus_index("Master"), linear_to_db(value))


func _on_colorblind_pressed():
	# Aquí implementarías el cambio de filtro (ver siguiente sección)
	pass
	
# Esto debe estar en el script donde conectaste el botón "option"
