extends WorldEnvironment

func _ready() -> void:
	Globalsettings.brightness_updated.connect(_on_brightness_updated)

func _on_brightness_updated(value: float) -> void:
	if environment:
		environment.adjustment_enabled = true
		environment.adjustment_brightness = value
