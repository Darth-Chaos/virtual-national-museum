extends StaticBody3D

# Referencia al panel (carga la escena)
var panel = preload("res://scenes/cuadro_panel.tscn").instantiate()
var panel_visible = false

func _ready():
	# Añade el panel al árbol de escenas pero oculto
	get_tree().root.add_child(panel)
	panel.hide()

func _input(event):
	if event.is_action_pressed("interactuar") and panel_visible:
		panel.hide()
		panel_visible = false

func _on_area_3d_body_entered(body):
	if body.name == "Player":  # Ajusta según el nombre de tu jugador
		panel.show()
		panel_visible = true

func _on_area_3d_body_exited(body):
	if body.name == "Player":
		panel.hide()
		panel_visible = false
		
