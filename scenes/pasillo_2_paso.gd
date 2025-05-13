extends Area3D

@export var next_scene_path: String = ""
@export var spawn_point_name: String = ""

func _on_body_entered(body: Node) -> void:
	if body.is_in_group("Player"):
		print("✅ Jugador detectado. Transfiriendo a: %s" % next_scene_path)

		var player = body
		var packed_scene = load(next_scene_path)

		if packed_scene == null:
			printerr("❌ Error al cargar la escena: %s" % next_scene_path)
			return

		var err = get_tree().change_scene_to_packed(packed_scene)
		if err != OK:
			printerr("❌ Error al cambiar de escena.")
			return

		# Llamamos diferido para que la escena tenga tiempo de cargarse
		call_deferred("_finalizar_teletransporte", player)


func _finalizar_teletransporte(player: Node) -> void:
	var new_scene = get_tree().current_scene
	if new_scene == null:
		printerr("❌ La nueva escena no se cargó correctamente.")
		return

	var spawn_point = new_scene.get_node_or_null(spawn_point_name)
	if spawn_point == null:
		printerr("❌ SpawnPoint '%s' no encontrado en la nueva escena." % spawn_point_name)
		return

	print("✅ Spawn point localizado en:", spawn_point.global_transform.origin)
	spawn_point.add_child(player)
	player.global_transform = spawn_point.global_transform
