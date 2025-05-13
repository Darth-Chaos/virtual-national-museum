extends Area3D

const NEXT_SCENE_PATH := "res://scenes/Room_1.tscn"

func _ready():
	body_entered.connect(_on_body_entered)

func _on_body_entered(body):
	if body.is_in_group("Player"):
		print("Jugador detectado. Transfiriendo a la nueva escena...")
		
		# 1. Guardar referencia al jugador y removerlo de la escena actual
		var player = body
		player.get_parent().remove_child(player)
		
		# 2. Cargar la nueva escena
		var new_scene = load(NEXT_SCENE_PATH).instantiate()
		
		# 3. Añadir el jugador a la nueva escena ANTES de cargarla
		new_scene.add_child(player)
		
		# 4. Posicionar al jugador en el Marker3D "SpawnPoint"
		var spawn_point = new_scene.get_node("SpawnPoint") as Marker3D
		if spawn_point:
			player.global_transform = spawn_point.global_transform
		else:
			printerr("¡No se encontró el nodo SpawnPoint en Room_1!")
		
		# 5. Cambiar la escena
		get_tree().root.add_child(new_scene)
		get_tree().current_scene.queue_free()  # Eliminar escena anterior
		
		print("Escena cambiada exitosamente. Player conservado.")
