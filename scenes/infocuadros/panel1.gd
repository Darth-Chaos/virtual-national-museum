extends CanvasLayer

# Función que se ejecuta al presionar el botón "Cerrar"
func _on_button_pressed():
	get_node("Panel").hide()  # Oculta solo el Panel, no todo el CanvasLayer
	
