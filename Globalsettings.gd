extends Node


@warning_ignore("unused_signal")
signal brightness_updated(value)

# Brillo
func set_brightness(value: float) -> void:
	emit_signal("brightness_updated", value)
	
# audio
func update_master_vol(bus_idx, vol):  # -50 es volumen mínimo
	if vol > -50:
		AudioServer.set_bus_volume_db(bus_idx, vol)
		AudioServer.set_bus_mute(bus_idx, false)
	else:
		AudioServer.set_bus_mute(bus_idx, true)
	#match bus_idx:
	#	0:
	 
